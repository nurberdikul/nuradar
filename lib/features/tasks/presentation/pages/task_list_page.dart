import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/task_provider.dart';
import '../widgets/create_task_sheet.dart';
import '../widgets/task_card.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // В Riverpod_generator 2.x/3.x провайдер генерируется с именем [className]Provider
    final tasksAsyncValue = ref.watch(tasksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('nuradar - задачи')),
      body: tasksAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Ошибка: $err')),
        data: (tasks) {
          if (tasks.isEmpty) {
            return const Center(
              child: Text(
                'У вас пока нет задач',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          final activeTasks = tasks.where((t) => !t.isCompleted).toList();
          final completedTasks = tasks.where((t) => t.isCompleted).toList();

          // Сортировка активных задач по приоритету (High -> Low)
          activeTasks.sort(
            (a, b) => b.priority.index.compareTo(a.priority.index),
          );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Активные задачи
              ...activeTasks.map((task) => TaskCard(task: task)),

              // Заголовок для выполненных задач
              if (completedTasks.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Выполненные',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                // Выполненные задачи
                ...completedTasks.map((task) => TaskCard(task: task)),
              ],
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const CreateTaskSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
