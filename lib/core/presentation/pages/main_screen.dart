import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../../features/map_spots/presentation/pages/map_page.dart';
import '../../../features/tasks/presentation/pages/task_list_page.dart';
import '../../theme/app_theme.dart';
import '../../../features/tasks/presentation/providers/task_provider.dart';

class NavigationIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void updateIndex(int index) {
    state = index;
  }
}

final navigationIndexProvider = NotifierProvider<NavigationIndexNotifier, int>(NavigationIndexNotifier.new);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    final pages = [
      const DashboardPage(),
      const TaskListPage(),
      const MapPage(),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar with initial
              CircleAvatar(
                radius: 48,
                backgroundColor: AppTheme.primaryLight,
                child: Builder(builder: (context) {
                  final email = FirebaseAuth.instance.currentUser?.email ?? 'User';
                  final name = email.split('@')[0];
                  final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
                  return Text(
                    initial,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  );
                }),
              ),
              const SizedBox(height: 16),
              // Full email
              Text(
                FirebaseAuth.instance.currentUser?.email ?? 'User',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              // Task count
              Builder(builder: (context) {
                final tasksAsync = ref.watch(tasksProvider);
                return tasksAsync.when(
                  data: (tasks) {
                    final sessions = tasks.where((t) => t.totalFocusTime > 0).toList();
                    if (sessions.isEmpty) {
                      return const Text('Нет данных о фокусе');
                    }

                    int totalPlanned = 0;
                    int totalActual = 0;
                    int interruptions = 0;
                    int secondsLost = 0;

                    for (final task in sessions) {
                      totalPlanned += task.totalFocusTime;
                      totalActual += task.actualFocusTime;
                      if (task.wasInterrupted) {
                        interruptions++;
                        secondsLost += (task.totalFocusTime - task.actualFocusTime);
                      }
                    }

                    final focusIndex = (totalActual / totalPlanned * 100).round();
                    final indexColor = focusIndex >= 50 ? AppTheme.successColor : AppTheme.errorColor;

                    return Column(
                      children: [
                        Text(
                          'Индекс Фокуса: $focusIndex%',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: indexColor,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Ты сорвался $interruptions раз на этой неделе,\nпотеряв ${secondsLost ~/ 60} минут фокуса',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                        ),
                      ],
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (_, __) => const Text('Ошибка загрузки статистики'),
                );
              }),
              const SizedBox(height: 32),
              // Sign out button
              ElevatedButton.icon(
                onPressed: () => FirebaseAuth.instance.signOut(),
                icon: const Icon(Icons.logout),
                label: const Text('Выйти'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(navigationIndexProvider.notifier).updateIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryLight,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Цели',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Зоны фокуса',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
