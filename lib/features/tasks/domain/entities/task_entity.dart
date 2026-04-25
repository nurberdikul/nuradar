import 'package:freezed_annotation/freezed_annotation.dart';
import 'task_priority.dart';

part 'task_entity.freezed.dart';

@freezed
abstract class Milestone with _$Milestone {
  const factory Milestone({
    required String id,
    required String title,
    @Default(false) bool isDone,
  }) = _Milestone;
}

@freezed
abstract class TaskEntity with _$TaskEntity {
  const TaskEntity._();

  const factory TaskEntity({
    required String id,
    required String title,
    required String description,
    required DateTime dueDate,
    @Default(TaskPriority.medium) TaskPriority priority,
    @Default(false) bool isCompleted,
    @Default([]) List<String> imageUrls,
    @Default([]) List<Milestone> milestones,
    @Default(0) int totalFocusTime,
    @Default(0) int actualFocusTime,
    @Default(false) bool wasInterrupted,
    String? recognizedText,
    String? category,
    double? latitude,
    double? longitude,
    String? userId,
  }) = _TaskEntity;
}
