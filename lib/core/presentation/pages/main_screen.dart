import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../../features/map_spots/presentation/pages/map_page.dart';
import '../../../features/tasks/presentation/pages/task_list_page.dart';
import '../../theme/app_theme.dart';
import '../../../features/tasks/presentation/providers/task_provider.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<NavigationProvider>().currentIndex;

    final pages = [
      const DashboardPage(),
      const TaskListPage(),
      const MapPage(),
      const ProfileTab(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          context.read<NavigationProvider>().updateIndex(index);
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
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Зоны фокуса'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.darkBackgroundColor,
        title: const Text(
          'Выйти?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Вы уверены, что хотите выйти из аккаунта?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена', style: TextStyle(color: Colors.blueAccent)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Выйти', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();
    final tasks = taskProvider.tasks;
    final isLoading = taskProvider.isLoading;
    final error = taskProvider.error;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Avatar
            CircleAvatar(
              radius: 60,
              backgroundColor: AppTheme.primaryLight,
              child: Builder(
                builder: (context) {
                  final email = FirebaseAuth.instance.currentUser?.email ?? 'User';
                  final initial = email.isNotEmpty ? email[0].toUpperCase() : '?';
                  return Text(
                    initial,
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              FirebaseAuth.instance.currentUser?.email ?? 'User',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 40),

            // Focus Insights
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (error != null)
              const Text('Ошибка загрузки статистики')
            else
              Builder(
                builder: (context) {
                  final sessions = tasks.where((t) => t.totalFocusTime > 0).toList();

                  int totalPlanned = 0;
                  int totalActual = 0;
                  int interruptions = 0;
                  for (final task in sessions) {
                    totalPlanned += task.totalFocusTime;
                    totalActual += task.actualFocusTime;
                    interruptions += task.interruptions;
                  }

                  final focusIndex = totalPlanned > 0 ? (totalActual / totalPlanned * 100).round() : 0;
                  
                  final today = DateTime.now();
                  final List<double> weeklyStats = List.filled(7, 0.0);
                  double maxStat = 0;
                  for (final task in sessions) {
                    final difference = today.difference(task.dueDate).inDays;
                    if (difference >= 0 && difference < 7) {
                      final index = 6 - difference;
                      weeklyStats[index] += task.actualFocusTime / 60.0;
                      if (weeklyStats[index] > maxStat) {
                        maxStat = weeklyStats[index];
                      }
                    }
                  }

                  final chartMaxY = maxStat <= 0 ? 60.0 : maxStat * 1.2;
                  final yInterval = math.max(1.0, (chartMaxY / 5).floorToDouble());

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Статистика фокуса',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.5,
                        children: [
                          _StatCard(
                            title: 'Индекс Фокуса',
                            value: '$focusIndex%',
                            color: focusIndex >= 50 ? AppTheme.successColor : AppTheme.errorColor,
                            icon: Icons.speed,
                          ),
                          _StatCard(
                            title: 'Минуты успеха',
                            value: '${totalActual ~/ 60}',
                            color: AppTheme.primaryColor,
                            icon: Icons.timer,
                          ),
                          _StatCard(
                            title: 'Срывы',
                            value: '$interruptions',
                            color: Colors.orange,
                            icon: Icons.warning_amber_rounded,
                          ),
                          _StatCard(
                            title: 'Всего сессий',
                            value: '${sessions.length}',
                            color: Colors.blue,
                            icon: Icons.history,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Активность за 7 дней',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: chartMaxY,
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    final date = today.subtract(Duration(days: 6 - value.toInt()));
                                    const days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
                                    return Text(days[date.weekday - 1], style: const TextStyle(fontSize: 10));
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  interval: yInterval,
                                  getTitlesWidget: (value, meta) => Text('${value.toInt()}м', style: const TextStyle(fontSize: 10)),
                                ),
                              ),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            gridData: const FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                            barGroups: List.generate(7, (index) {
                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: weeklyStats[index],
                                    color: AppTheme.primaryLight,
                                    width: 12,
                                    borderRadius: BorderRadius.circular(4),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

            const SizedBox(height: 48),

            // Logout
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context),
                icon: const Icon(Icons.logout),
                label: const Text('Выйти из аккаунта'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  side: const BorderSide(color: Colors.redAccent),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 40),
            // Footer
            const Text(
              'v1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const Text(
              'Made with focus for SDU',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 11, color: Colors.black54),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
