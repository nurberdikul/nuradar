import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../tasks/presentation/providers/task_provider.dart';
import '../../../tasks/presentation/widgets/task_card.dart';
import '../../../tasks/presentation/pages/focus_session_page.dart';
import '../../../map_spots/presentation/providers/map_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/dashboard_providers.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const _months = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря',
  ];

  Future<void> _checkLocation(BuildContext context) async {
    final mapProvider = context.read<MapProvider>();
    final taskProvider = context.read<TaskProvider>();
    
    CustomSnackbar.showInfo(context, 'Проверяем локацию...');

    await mapProvider.updateLocation();
    
    if (!context.mounted) return;
    
    if (mapProvider.error != null) {
      CustomSnackbar.showError(context, 'Ошибка локации: ${mapProvider.error}');
      return;
    }

    final nearbyTask = mapProvider.checkNearbyTasks(taskProvider.tasks);
    if (nearbyTask != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppTheme.darkBackgroundColor,
          title: const Text('Зона фокуса рядом!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          content: Text('Вы рядом с местом выполнения задачи "${nearbyTask.title}". Начать сессию?', style: const TextStyle(color: Colors.white70)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Позже', style: TextStyle(color: Colors.blueAccent)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => FocusSessionPage(task: nearbyTask)));
              },
              child: const Text('Начать', style: TextStyle(color: AppTheme.primaryLight)),
            ),
          ],
        ),
      );
    } else {
      CustomSnackbar.showInfo(context, 'Рядом нет активных задач с привязанной локацией.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();
    final taskProvider = context.watch<TaskProvider>();
    final today = DateTime.now();
    final dateStr = '${today.day} ${_months[today.month - 1]}, ${today.year}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('nuradar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching),
            tooltip: 'Проверить геозоны',
            onPressed: () => _checkLocation(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Приветствие и дата
            Builder(
              builder: (context) {
                final authProvider = context.watch<AuthProvider>();
                final user = authProvider.user ?? FirebaseAuth.instance.currentUser;
                final email = user?.email ?? '';
                final name = user?.displayName?.isNotEmpty == true 
                    ? user!.displayName! 
                    : (email.isNotEmpty ? email.split('@')[0] : 'Друг');
                return Text(
                  'Привет, $name! 👋',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            Text(
              dateStr,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Погода
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.wb_sunny, color: Colors.orange, size: 36),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Погода в Алматы',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (dashboardProvider.isLoadingWeather)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          else if (dashboardProvider.weatherError != null)
                            const Text(
                              'Ошибка загрузки',
                              style: TextStyle(color: Colors.red),
                            )
                          else
                            Text(
                              dashboardProvider.weather ?? '',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Заголовок списка
            Text(
              'Готовы к фокусу?',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Список задач
            Expanded(
              child: Builder(
                builder: (context) {
                  if (taskProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (taskProvider.error != null) {
                    return Center(child: Text('Ошибка загрузки задач: ${taskProvider.error}'));
                  }

                  final tasks = taskProvider.tasks;
                  // 1. Фильтруем только невыполненные
                  final activeTasks = tasks
                      .where((t) => !t.isCompleted)
                      .toList();

                  // 2. Сортируем по приоритету (High -> Low)
                  activeTasks.sort(
                    (a, b) => b.priority.index.compareTo(a.priority.index),
                  );

                  // 3. Берем максимум 3 задачи
                  final topTasks = activeTasks.take(3).toList();

                  // 4. Если невыполненных задач нет — показываем пустой стейт успеха
                  if (topTasks.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 64,
                            color: AppTheme.primaryColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Нет активных целей. Добавь цель и запусти таймер!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: topTasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(task: topTasks[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
