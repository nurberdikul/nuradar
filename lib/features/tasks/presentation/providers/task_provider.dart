import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../../data/repositories/task_repository_impl.dart';

part 'task_provider.g.dart';

@riverpod
TaskRepository taskRepository(Ref ref) {
  return TaskRepositoryImpl(
    firestore: FirebaseFirestore.instance, // real Firestore instance
    taskBox: Hive.box('offline_tasks'),
  );
}

@riverpod
class TasksNotifier extends _$TasksNotifier {
  @override
  Future<List<TaskEntity>> build() async {
    final repository = ref.watch(taskRepositoryProvider);
    return repository.getTasks();
  }

  Future<void> addTask(TaskEntity task) async {
    final repository = ref.read(taskRepositoryProvider);
    final currentTasks = state.value ?? [];
    state = AsyncData([...currentTasks, task]);
    try {
      await repository.addTask(task);
    } catch (e, st) {
      state = AsyncData(currentTasks);
      state = AsyncError(e, st);
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    final repository = ref.read(taskRepositoryProvider);
    final currentTasks = state.value ?? [];
    final updatedTasks = currentTasks.map((t) => t.id == task.id ? task : t).toList();
    state = AsyncData(updatedTasks);
    try {
      await repository.updateTask(task);
    } catch (e, st) {
      state = AsyncData(currentTasks);
      state = AsyncError(e, st);
    }
  }

  Future<void> toggleTaskCompletion(TaskEntity task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await updateTask(updatedTask);
  }

  Future<void> deleteTask(String id) async {
    final repository = ref.read(taskRepositoryProvider);
    final currentTasks = state.value ?? [];
    final updatedTasks = currentTasks.where((t) => t.id != id).toList();
    state = AsyncData(updatedTasks);
    try {
      await repository.deleteTask(id);
    } catch (e, st) {
      state = AsyncData(currentTasks);
      state = AsyncError(e, st);
    }
  }
}
