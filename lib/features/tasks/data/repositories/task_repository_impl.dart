import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/task_model.dart';

/// Concrete implementation of [TaskRepository].
///
/// Follows an **Offline-first** strategy:
/// - All reads are served instantly from the local [Box] (Hive).
/// - Writes are committed to the local box first so the UI updates without
///   waiting for network round-trips.
/// - Firestore is treated as a best-effort remote sync target; any network
///   errors are caught and logged, never re-thrown to the UI layer.
class TaskRepositoryImpl implements TaskRepository {
  /// Firestore instance used for remote persistence.
  final FirebaseFirestore? _firestore;

  /// Hive box used as the local cache / offline store.
  /// Keys are task IDs (Strings), values are JSON Maps.
  final Box _taskBox;

  static const String _kCollection = 'tasks';

  TaskRepositoryImpl({FirebaseFirestore? firestore, required Box taskBox})
    : _firestore = firestore ?? FirebaseFirestore.instance,
      _taskBox = taskBox;

  // ──────────────────────────────────────────────────────────────────────────
  // READ
  // ──────────────────────────────────────────────────────────────────────────

  /// Returns tasks using a **stale-while-revalidate** pattern:
  ///
  /// 1. Immediately reads and returns data from the local Hive box (fast, works
  ///    offline).
  /// 2. Fires a Firestore request in the background; if it succeeds, updates
  ///    the local box for subsequent reads.
  @override
  Future<List<TaskEntity>> getTasks() async {
    // 1️⃣ Read from the local cache and return immediately.
    final localTasks = _readFromBox();

    // 2️⃣ Kick off a background sync with Firestore (fire-and-forget).
    _syncFromFirestore();

    return localTasks;
  }

  // ──────────────────────────────────────────────────────────────────────────
  // WRITE
  // ──────────────────────────────────────────────────────────────────────────

  /// Adds a new task.
  ///
  /// Persists to Hive first so the UI reflects the change instantly.
  /// Then attempts a Firestore write; failures are swallowed and logged.
  @override
  Future<void> addTask(TaskEntity task) async {
    final model = TaskModel.fromEntity(task);

    // 1️⃣ Persist locally first — UI updates immediately.
    await _saveToBox(model);

    // 2️⃣ Best-effort remote write.
    await _setInFirestore(model);
  }

  /// Updates an existing task.
  ///
  /// Same offline-first strategy as [addTask].
  @override
  Future<void> updateTask(TaskEntity task) async {
    final model = TaskModel.fromEntity(task);

    // 1️⃣ Update local cache immediately.
    await _saveToBox(model);

    // 2️⃣ Best-effort remote update.
    await _setInFirestore(model);
  }

  /// Deletes a task by [id].
  ///
  /// Removes from the local box first, then attempts Firestore deletion.
  @override
  Future<void> deleteTask(String id) async {
    // 1️⃣ Remove from local cache immediately.
    await _taskBox.delete(id);

    // 2️⃣ Best-effort remote deletion.
    if (_firestore == null) return;
    try {
      await _firestore.collection(_kCollection).doc(id).delete();
    } catch (e, st) {
      // Network unavailable or other transient error — will be cleaned up
      // during the next successful sync.
      log(
        'TaskRepositoryImpl: failed to delete task $id from Firestore.',
        error: e,
        stackTrace: st,
        name: 'TaskRepository',
      );
    }
  }

  // ──────────────────────────────────────────────────────────────────────────
  // PRIVATE HELPERS
  // ──────────────────────────────────────────────────────────────────────────

  /// Deserializes all entries stored in the Hive box into [TaskEntity] objects.
  List<TaskEntity> _readFromBox() {
    final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    return _taskBox.values
        .whereType<Map>()
        .map((raw) => TaskModel.fromJson(Map<String, dynamic>.from(raw)))
        .where((model) => model.userId == currentUserUid)
        .map((model) => model.toEntity())
        .toList();
  }

  /// Persists a [TaskModel] to the local Hive box, keyed by [TaskModel.id].
  Future<void> _saveToBox(TaskModel model) async {
    await _taskBox.put(model.id, model.toJson());
  }

  /// Creates or overwrites a document in Firestore.
  /// All exceptions are caught; failures are logged and silently ignored so
  /// that the app remains fully functional while offline.
  Future<void> _setInFirestore(TaskModel model) async {
    if (_firestore == null) {
      return;
    }
    try {
      await _firestore
          .collection(_kCollection)
          .doc(model.id)
          .set(model.toJson());
    } catch (e, st) {
      log(
        'TaskRepositoryImpl: failed to sync task ${model.id} to Firestore.',
        error: e,
        stackTrace: st,
        name: 'TaskRepository',
      );
      // TODO(team): queue the model for a background sync when connectivity
      // is restored (e.g. using WorkManager / connectivity_plus).
    }
  }

  /// Fetches all tasks from Firestore and refreshes the local Hive box.
  /// Called as a background fire-and-forget inside [getTasks].
  Future<void> _syncFromFirestore() async {
    if (_firestore == null) return;
    try {
      final currentUserUid = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserUid == null) return;

      final snapshot = await _firestore
          .collection(_kCollection)
          .where('userId', isEqualTo: currentUserUid)
          .get();

      for (final doc in snapshot.docs) {
        final model = TaskModel.fromJson(doc.data());
        await _saveToBox(model);
      }

      log(
        'TaskRepositoryImpl: synced ${snapshot.docs.length} tasks from '
        'Firestore.',
        name: 'TaskRepository',
      );
    } catch (e, st) {
      log(
        'TaskRepositoryImpl: background Firestore sync failed.',
        error: e,
        stackTrace: st,
        name: 'TaskRepository',
      );
    }
  }
}
