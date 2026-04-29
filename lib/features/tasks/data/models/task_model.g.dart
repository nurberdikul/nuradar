// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MilestoneModelAdapter extends TypeAdapter<MilestoneModel> {
  @override
  final typeId = 1;

  @override
  MilestoneModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MilestoneModel(
      id: fields[0] as String,
      title: fields[1] as String,
      isDone: fields[2] == null ? false : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MilestoneModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MilestoneModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      dueDate: fields[3] as DateTime,
      priority: fields[4] == null
          ? TaskPriority.medium
          : fields[4] as TaskPriority,
      isCompleted: fields[5] == null ? false : fields[5] as bool,
      imageUrls: fields[6] == null ? [] : (fields[6] as List).cast<String>(),
      milestones: fields[7] == null
          ? []
          : (fields[7] as List).cast<MilestoneModel>(),
      totalFocusTime: fields[8] == null ? 0 : (fields[8] as num).toInt(),
      actualFocusTime: fields[9] == null ? 0 : (fields[9] as num).toInt(),
      interruptions: fields[10] == null ? 0 : (fields[10] as num).toInt(),
      plannedDuration: fields[11] == null ? 25 : (fields[11] as num).toInt(),
      recognizedText: fields[12] as String?,
      category: fields[13] as String?,
      latitude: (fields[14] as num?)?.toDouble(),
      longitude: (fields[15] as num?)?.toDouble(),
      userId: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dueDate)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.isCompleted)
      ..writeByte(6)
      ..write(obj.imageUrls)
      ..writeByte(7)
      ..write(obj.milestones)
      ..writeByte(8)
      ..write(obj.totalFocusTime)
      ..writeByte(9)
      ..write(obj.actualFocusTime)
      ..writeByte(10)
      ..write(obj.interruptions)
      ..writeByte(11)
      ..write(obj.plannedDuration)
      ..writeByte(12)
      ..write(obj.recognizedText)
      ..writeByte(13)
      ..write(obj.category)
      ..writeByte(14)
      ..write(obj.latitude)
      ..writeByte(15)
      ..write(obj.longitude)
      ..writeByte(16)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
  interruptions: (json['interruptions'] as num?)?.toInt() ?? 0,
  plannedDuration: (json['plannedDuration'] as num?)?.toInt() ?? 25,
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
      'interruptions': instance.interruptions,
      'plannedDuration': instance.plannedDuration,
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
