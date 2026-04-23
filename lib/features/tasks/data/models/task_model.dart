import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task_entity.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const TaskModel._();

  const factory TaskModel({
    required String id,
    required String title,
    required String description,
    required DateTime dueDate,
    @Default(false) bool isCompleted,
    @Default([]) List<String> imageUrls,
    String? category,
    double? latitude,
    double? longitude,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dueDate: entity.dueDate,
      isCompleted: entity.isCompleted,
      imageUrls: entity.imageUrls,
      category: entity.category,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      dueDate: dueDate,
      isCompleted: isCompleted,
      imageUrls: imageUrls,
      category: category,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
