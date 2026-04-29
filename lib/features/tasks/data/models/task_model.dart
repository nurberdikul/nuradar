import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/entities/task_priority.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
@HiveType(typeId: 1)
abstract class MilestoneModel with _$MilestoneModel {
  const MilestoneModel._();

  const factory MilestoneModel({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) @Default(false) bool isDone,
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
@HiveType(typeId: 0)
abstract class TaskModel with _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required DateTime dueDate,
    @HiveField(4) @Default(TaskPriority.medium) TaskPriority priority,
    @HiveField(5) @Default(false) bool isCompleted,
    @HiveField(6) @Default([]) List<String> imageUrls,
    @HiveField(7) @Default([]) List<MilestoneModel> milestones,
    @HiveField(8) @Default(0) int totalFocusTime,
    @HiveField(9) @Default(0) int actualFocusTime,
    @HiveField(10) @JsonKey(defaultValue: 0) @Default(0) int interruptions,
    @HiveField(11) @JsonKey(defaultValue: 25) @Default(25) int plannedDuration,
    @HiveField(12) String? recognizedText,
    @HiveField(13) String? category,
    @HiveField(14) double? latitude,
    @HiveField(15) double? longitude,
    @HiveField(16) String? userId,
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
