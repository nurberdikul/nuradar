import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../domain/entities/task_entity.dart';
import '../pages/task_detail_page.dart';
import '../providers/task_provider.dart';

class TaskCard extends ConsumerWidget {
  final TaskEntity task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppTheme.errorColor,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        ref.read(tasksProvider.notifier).deleteTask(task.id);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskDetailPage(task: task),
              ),
            );
          },
          leading: task.imageUrls.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: kIsWeb
                        ? Image.network(
                            task.imageUrls.first,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(task.imageUrls.first),
                            fit: BoxFit.cover,
                          ),
                  ),
                )
              : null,
          title: Text(
            task.title,
            style: TextStyle(
              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
              color: task.isCompleted ? Colors.grey : null,
            ),
          ),
          subtitle: task.category != null ? Text(task.category!) : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (task.latitude != null && task.longitude != null)
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.location_on,
                    size: 20,
                    color: Colors.blue,
                  ),
                ),
              Checkbox(
                activeColor: AppTheme.successColor,
                value: task.isCompleted,
                onChanged: (bool? value) {
                  ref.read(tasksProvider.notifier).toggleTaskCompletion(task);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
