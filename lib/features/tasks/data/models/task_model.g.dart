// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MilestoneModel _$MilestoneModelFromJson(Map<String, dynamic> json) =>
    _MilestoneModel(
      id: json['id'] as String,
      title: json['title'] as String,
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$MilestoneModelToJson(_MilestoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isDone': instance.isDone,
    };

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  dueDate: DateTime.parse(json['dueDate'] as String),
  priority:
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
      TaskPriority.medium,
  isCompleted: json['isCompleted'] as bool? ?? false,
  imageUrls:
      (json['imageUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  milestones:
      (json['milestones'] as List<dynamic>?)
          ?.map((e) => MilestoneModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalFocusTime: (json['totalFocusTime'] as num?)?.toInt() ?? 0,
  actualFocusTime: (json['actualFocusTime'] as num?)?.toInt() ?? 0,
  wasInterrupted: json['wasInterrupted'] as bool? ?? false,
  recognizedText: json['recognizedText'] as String?,
  category: json['category'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  userId: json['userId'] as String?,
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate.toIso8601String(),
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'isCompleted': instance.isCompleted,
      'imageUrls': instance.imageUrls,
      'milestones': instance.milestones,
      'totalFocusTime': instance.totalFocusTime,
      'actualFocusTime': instance.actualFocusTime,
      'wasInterrupted': instance.wasInterrupted,
      'recognizedText': instance.recognizedText,
      'category': instance.category,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'userId': instance.userId,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
