import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../../data/repositories/task_repository_impl.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository _repository;

  List<TaskEntity> _tasks = [];
  bool _isLoading = false;
  String? _error;

  List<TaskEntity> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  TaskProvider()
      : _repository = TaskRepositoryImpl(
          firestore: FirebaseFirestore.instance,
          taskBox: Hive.box('offline_tasks'),
        ) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _tasks = await _repository.getTasks();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(TaskEntity task) async {
    final currentTasks = List<TaskEntity>.from(_tasks);
    _tasks.add(task);
    notifyListeners();

    try {
      await _repository.addTask(task);
    } catch (e) {
      _tasks = currentTasks;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    final currentTasks = List<TaskEntity>.from(_tasks);
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();

      try {
        await _repository.updateTask(task);
      } catch (e) {
        _tasks = currentTasks;
        _error = e.toString();
        notifyListeners();
      }
    }
  }

  Future<void> toggleTaskCompletion(TaskEntity task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await updateTask(updatedTask);
  }

  Future<void> deleteTask(String id) async {
    final currentTasks = List<TaskEntity>.from(_tasks);
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();

    try {
      await _repository.deleteTask(id);
    } catch (e) {
      _tasks = currentTasks;
      _error = e.toString();
      notifyListeners();
    }
  }
}
