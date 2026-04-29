import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../../data/repositories/task_repository_impl.dart';

class TaskProvider extends ChangeNotifier {
  TaskRepository? _repository;
  String? _currentUid;

  List<TaskEntity> _tasks = [];
  bool _isLoading = false;
  String? _error;

  List<TaskEntity> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  TaskProvider();

  Future<void> switchUser(String? uid) async {
    // Immediate UI reset
    _tasks.clear();
    notifyListeners();
    print('Switching user: $uid');

    // Close all Hive boxes to ensure no cross‑user data leakage
    await Hive.close();
    print('All Hive boxes closed before switching user');

    if (uid == null) {
      // Logout – nothing to open
      _repository = null;
      _currentUid = null;
      return;
    }

    // Avoid reopening same box unnecessarily
    if (_currentUid == uid && _repository != null) {
      return;
    }
    _currentUid = uid;

    final boxName = 'tasks_$uid';
    print('DEBUG: Current Box Name: $boxName');
    final taskBox = await Hive.openBox(boxName);

    _repository = TaskRepositoryImpl(
      firestore: FirebaseFirestore.instance,
      taskBox: taskBox,
    );
    await loadTasks();
  }

  // Full reset used on logout or provider recreation
  Future<void> clearAllData() async {
    _tasks.clear();
    _repository = null;
    _currentUid = null;
    await Hive.close();
    notifyListeners();
    print('All task data cleared and Hive closed');
  }

  Future<void> loadTasks() async {
    if (_repository == null) return;
    
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _tasks = await _repository!.getTasks();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addTask(TaskEntity task) async {
    if (_repository == null) return;

    final currentTasks = List<TaskEntity>.from(_tasks);
    _tasks.add(task);
    notifyListeners();

    try {
      await _repository!.addTask(task);
    } catch (e) {
      _tasks = currentTasks;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateTask(TaskEntity task) async {
    if (_repository == null) return;

    final currentTasks = List<TaskEntity>.from(_tasks);
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();

      try {
        await _repository!.updateTask(task);
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
    if (_repository == null) return;

    final currentTasks = List<TaskEntity>.from(_tasks);
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();

    try {
      await _repository!.deleteTask(id);
    } catch (e) {
      _tasks = currentTasks;
      _error = e.toString();
      notifyListeners();
    }
  }
}
