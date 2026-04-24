import 'package:freezed_annotation/freezed_annotation.dart';
import 'task_priority.dart';

part 'task_entity.freezed.dart';

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
    String? category,
    double? latitude,
    double? longitude,
    String? userId,
  }) = _TaskEntity;
}
