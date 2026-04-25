import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/create_task_sheet.dart';
import '../widgets/task_card.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<TaskProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('nuradar - задачи')),
      body: Builder(
        builder: (context) {
          if (taskProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (taskProvider.error != null) {
            return Center(child: Text('Ошибка: ${taskProvider.error}'));
          }

          final tasks = taskProvider.tasks;
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
