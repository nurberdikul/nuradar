import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/entities/task_priority.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class MilestoneModel with _$MilestoneModel {
  const MilestoneModel._();

  const factory MilestoneModel({
    required String id,
    required String title,
    @Default(false) bool isDone,
  }) = _MilestoneModel;

  factory MilestoneModel.fromJson(Map<String, dynamic> json) =>
      _$MilestoneModelFromJson(json);

  factory MilestoneModel.fromEntity(Milestone entity) {
    return MilestoneModel(
      id: entity.id,
      title: entity.title,
      isDone: entity.isDone,
    );
  }

  Milestone toEntity() {
    return Milestone(id: id, title: title, isDone: isDone);
  }
}

@freezed
abstract class TaskModel with _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    required String id,
    required String title,
    required String description,
    required DateTime dueDate,
    @Default(TaskPriority.medium) TaskPriority priority,
    @Default(false) bool isCompleted,
    @Default([]) List<String> imageUrls,
    @Default([]) List<MilestoneModel> milestones,
    @Default(0) int totalFocusTime,
    @Default(0) int actualFocusTime,
    @JsonKey(defaultValue: 0) @Default(0) int interruptions,
    @JsonKey(defaultValue: 25) @Default(25) int plannedDuration,
    String? recognizedText,
    String? category,
    double? latitude,
    double? longitude,
    String? userId,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dueDate: entity.dueDate,
      priority: entity.priority,
      isCompleted: entity.isCompleted,
      imageUrls: entity.imageUrls,
      milestones: entity.milestones
          .map((m) => MilestoneModel.fromEntity(m))
          .toList(),
      totalFocusTime: entity.totalFocusTime,
      actualFocusTime: entity.actualFocusTime,
      interruptions: entity.interruptions,
      plannedDuration: entity.plannedDuration,
      recognizedText: entity.recognizedText,
      category: entity.category,
      latitude: entity.latitude,
      longitude: entity.longitude,
      userId: entity.userId,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      priority: priority,
      isCompleted: isCompleted,
      imageUrls: imageUrls,
      milestones: milestones.map((m) => m.toEntity()).toList(),
      totalFocusTime: totalFocusTime,
      actualFocusTime: actualFocusTime,
      interruptions: interruptions,
      plannedDuration: plannedDuration,
      recognizedText: recognizedText,
      category: category,
      latitude: latitude,
      longitude: longitude,
      userId: userId,
    );
  }
}
