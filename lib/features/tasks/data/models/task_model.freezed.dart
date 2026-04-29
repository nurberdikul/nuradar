// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MilestoneModel {

@HiveField(0) String get id;@HiveField(1) String get title;@HiveField(2) bool get isDone;
/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneModelCopyWith<MilestoneModel> get copyWith => _$MilestoneModelCopyWithImpl<MilestoneModel>(this as MilestoneModel, _$identity);

  /// Serializes this MilestoneModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isDone);

@override
String toString() {
  return 'MilestoneModel(id: $id, title: $title, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class $MilestoneModelCopyWith<$Res>  {
  factory $MilestoneModelCopyWith(MilestoneModel value, $Res Function(MilestoneModel) _then) = _$MilestoneModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String title,@HiveField(2) bool isDone
});




}
/// @nodoc
class _$MilestoneModelCopyWithImpl<$Res>
    implements $MilestoneModelCopyWith<$Res> {
  _$MilestoneModelCopyWithImpl(this._self, this._then);

  final MilestoneModel _self;
  final $Res Function(MilestoneModel) _then;

/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isDone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestoneModel].
extension MilestoneModelPatterns on MilestoneModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneModel value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneModel value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  bool isDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
return $default(_that.id,_that.title,_that.isDone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  bool isDone)  $default,) {final _that = this;
switch (_that) {
case _MilestoneModel():
return $default(_that.id,_that.title,_that.isDone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  bool isDone)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneModel() when $default != null:
return $default(_that.id,_that.title,_that.isDone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestoneModel extends MilestoneModel {
  const _MilestoneModel({@HiveField(0) required this.id, @HiveField(1) required this.title, @HiveField(2) this.isDone = false}): super._();
  factory _MilestoneModel.fromJson(Map<String, dynamic> json) => _$MilestoneModelFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String title;
@override@JsonKey()@HiveField(2) final  bool isDone;

/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneModelCopyWith<_MilestoneModel> get copyWith => __$MilestoneModelCopyWithImpl<_MilestoneModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isDone);

@override
String toString() {
  return 'MilestoneModel(id: $id, title: $title, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$MilestoneModelCopyWith<$Res> implements $MilestoneModelCopyWith<$Res> {
  factory _$MilestoneModelCopyWith(_MilestoneModel value, $Res Function(_MilestoneModel) _then) = __$MilestoneModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String title,@HiveField(2) bool isDone
});




}
/// @nodoc
class __$MilestoneModelCopyWithImpl<$Res>
    implements _$MilestoneModelCopyWith<$Res> {
  __$MilestoneModelCopyWithImpl(this._self, this._then);

  final _MilestoneModel _self;
  final $Res Function(_MilestoneModel) _then;

/// Create a copy of MilestoneModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isDone = null,}) {
  return _then(_MilestoneModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TaskModel {

@HiveField(0) String get id;@HiveField(1) String get title;@HiveField(2) String get description;@HiveField(3) DateTime get dueDate;@HiveField(4) TaskPriority get priority;@HiveField(5) bool get isCompleted;@HiveField(6) List<String> get imageUrls;@HiveField(7) List<MilestoneModel> get milestones;@HiveField(8) int get totalFocusTime;@HiveField(9) int get actualFocusTime;@HiveField(10)@JsonKey(defaultValue: 0) int get interruptions;@HiveField(11)@JsonKey(defaultValue: 25) int get plannedDuration;@HiveField(12) String? get recognizedText;@HiveField(13) String? get category;@HiveField(14) double? get latitude;@HiveField(15) double? get longitude;@HiveField(16) String? get userId;
/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskModelCopyWith<TaskModel> get copyWith => _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.milestones, milestones)&&(identical(other.totalFocusTime, totalFocusTime) || other.totalFocusTime == totalFocusTime)&&(identical(other.actualFocusTime, actualFocusTime) || other.actualFocusTime == actualFocusTime)&&(identical(other.interruptions, interruptions) || other.interruptions == interruptions)&&(identical(other.plannedDuration, plannedDuration) || other.plannedDuration == plannedDuration)&&(identical(other.recognizedText, recognizedText) || other.recognizedText == recognizedText)&&(identical(other.category, category) || other.category == category)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,priority,isCompleted,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(milestones),totalFocusTime,actualFocusTime,interruptions,plannedDuration,recognizedText,category,latitude,longitude,userId);

@override
String toString() {
  return 'TaskModel(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, isCompleted: $isCompleted, imageUrls: $imageUrls, milestones: $milestones, totalFocusTime: $totalFocusTime, actualFocusTime: $actualFocusTime, interruptions: $interruptions, plannedDuration: $plannedDuration, recognizedText: $recognizedText, category: $category, latitude: $latitude, longitude: $longitude, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res>  {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) = _$TaskModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) DateTime dueDate,@HiveField(4) TaskPriority priority,@HiveField(5) bool isCompleted,@HiveField(6) List<String> imageUrls,@HiveField(7) List<MilestoneModel> milestones,@HiveField(8) int totalFocusTime,@HiveField(9) int actualFocusTime,@HiveField(10)@JsonKey(defaultValue: 0) int interruptions,@HiveField(11)@JsonKey(defaultValue: 25) int plannedDuration,@HiveField(12) String? recognizedText,@HiveField(13) String? category,@HiveField(14) double? latitude,@HiveField(15) double? longitude,@HiveField(16) String? userId
});




}
/// @nodoc
class _$TaskModelCopyWithImpl<$Res>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? priority = null,Object? isCompleted = null,Object? imageUrls = null,Object? milestones = null,Object? totalFocusTime = null,Object? actualFocusTime = null,Object? interruptions = null,Object? plannedDuration = null,Object? recognizedText = freezed,Object? category = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? userId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,milestones: null == milestones ? _self.milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<MilestoneModel>,totalFocusTime: null == totalFocusTime ? _self.totalFocusTime : totalFocusTime // ignore: cast_nullable_to_non_nullable
as int,actualFocusTime: null == actualFocusTime ? _self.actualFocusTime : actualFocusTime // ignore: cast_nullable_to_non_nullable
as int,interruptions: null == interruptions ? _self.interruptions : interruptions // ignore: cast_nullable_to_non_nullable
as int,plannedDuration: null == plannedDuration ? _self.plannedDuration : plannedDuration // ignore: cast_nullable_to_non_nullable
as int,recognizedText: freezed == recognizedText ? _self.recognizedText : recognizedText // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskModel].
extension TaskModelPatterns on TaskModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  DateTime dueDate, @HiveField(4)  TaskPriority priority, @HiveField(5)  bool isCompleted, @HiveField(6)  List<String> imageUrls, @HiveField(7)  List<MilestoneModel> milestones, @HiveField(8)  int totalFocusTime, @HiveField(9)  int actualFocusTime, @HiveField(10)@JsonKey(defaultValue: 0)  int interruptions, @HiveField(11)@JsonKey(defaultValue: 25)  int plannedDuration, @HiveField(12)  String? recognizedText, @HiveField(13)  String? category, @HiveField(14)  double? latitude, @HiveField(15)  double? longitude, @HiveField(16)  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.dueDate,_that.priority,_that.isCompleted,_that.imageUrls,_that.milestones,_that.totalFocusTime,_that.actualFocusTime,_that.interruptions,_that.plannedDuration,_that.recognizedText,_that.category,_that.latitude,_that.longitude,_that.userId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  DateTime dueDate, @HiveField(4)  TaskPriority priority, @HiveField(5)  bool isCompleted, @HiveField(6)  List<String> imageUrls, @HiveField(7)  List<MilestoneModel> milestones, @HiveField(8)  int totalFocusTime, @HiveField(9)  int actualFocusTime, @HiveField(10)@JsonKey(defaultValue: 0)  int interruptions, @HiveField(11)@JsonKey(defaultValue: 25)  int plannedDuration, @HiveField(12)  String? recognizedText, @HiveField(13)  String? category, @HiveField(14)  double? latitude, @HiveField(15)  double? longitude, @HiveField(16)  String? userId)  $default,) {final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that.id,_that.title,_that.description,_that.dueDate,_that.priority,_that.isCompleted,_that.imageUrls,_that.milestones,_that.totalFocusTime,_that.actualFocusTime,_that.interruptions,_that.plannedDuration,_that.recognizedText,_that.category,_that.latitude,_that.longitude,_that.userId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  DateTime dueDate, @HiveField(4)  TaskPriority priority, @HiveField(5)  bool isCompleted, @HiveField(6)  List<String> imageUrls, @HiveField(7)  List<MilestoneModel> milestones, @HiveField(8)  int totalFocusTime, @HiveField(9)  int actualFocusTime, @HiveField(10)@JsonKey(defaultValue: 0)  int interruptions, @HiveField(11)@JsonKey(defaultValue: 25)  int plannedDuration, @HiveField(12)  String? recognizedText, @HiveField(13)  String? category, @HiveField(14)  double? latitude, @HiveField(15)  double? longitude, @HiveField(16)  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.dueDate,_that.priority,_that.isCompleted,_that.imageUrls,_that.milestones,_that.totalFocusTime,_that.actualFocusTime,_that.interruptions,_that.plannedDuration,_that.recognizedText,_that.category,_that.latitude,_that.longitude,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskModel extends TaskModel {
  const _TaskModel({@HiveField(0) required this.id, @HiveField(1) required this.title, @HiveField(2) required this.description, @HiveField(3) required this.dueDate, @HiveField(4) this.priority = TaskPriority.medium, @HiveField(5) this.isCompleted = false, @HiveField(6) final  List<String> imageUrls = const [], @HiveField(7) final  List<MilestoneModel> milestones = const [], @HiveField(8) this.totalFocusTime = 0, @HiveField(9) this.actualFocusTime = 0, @HiveField(10)@JsonKey(defaultValue: 0) this.interruptions = 0, @HiveField(11)@JsonKey(defaultValue: 25) this.plannedDuration = 25, @HiveField(12) this.recognizedText, @HiveField(13) this.category, @HiveField(14) this.latitude, @HiveField(15) this.longitude, @HiveField(16) this.userId}): _imageUrls = imageUrls,_milestones = milestones,super._();
  factory _TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String title;
@override@HiveField(2) final  String description;
@override@HiveField(3) final  DateTime dueDate;
@override@JsonKey()@HiveField(4) final  TaskPriority priority;
@override@JsonKey()@HiveField(5) final  bool isCompleted;
 final  List<String> _imageUrls;
@override@JsonKey()@HiveField(6) List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

 final  List<MilestoneModel> _milestones;
@override@JsonKey()@HiveField(7) List<MilestoneModel> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}

@override@JsonKey()@HiveField(8) final  int totalFocusTime;
@override@JsonKey()@HiveField(9) final  int actualFocusTime;
@override@HiveField(10)@JsonKey(defaultValue: 0) final  int interruptions;
@override@HiveField(11)@JsonKey(defaultValue: 25) final  int plannedDuration;
@override@HiveField(12) final  String? recognizedText;
@override@HiveField(13) final  String? category;
@override@HiveField(14) final  double? latitude;
@override@HiveField(15) final  double? longitude;
@override@HiveField(16) final  String? userId;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskModelCopyWith<_TaskModel> get copyWith => __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._milestones, _milestones)&&(identical(other.totalFocusTime, totalFocusTime) || other.totalFocusTime == totalFocusTime)&&(identical(other.actualFocusTime, actualFocusTime) || other.actualFocusTime == actualFocusTime)&&(identical(other.interruptions, interruptions) || other.interruptions == interruptions)&&(identical(other.plannedDuration, plannedDuration) || other.plannedDuration == plannedDuration)&&(identical(other.recognizedText, recognizedText) || other.recognizedText == recognizedText)&&(identical(other.category, category) || other.category == category)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,priority,isCompleted,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_milestones),totalFocusTime,actualFocusTime,interruptions,plannedDuration,recognizedText,category,latitude,longitude,userId);

@override
String toString() {
  return 'TaskModel(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, isCompleted: $isCompleted, imageUrls: $imageUrls, milestones: $milestones, totalFocusTime: $totalFocusTime, actualFocusTime: $actualFocusTime, interruptions: $interruptions, plannedDuration: $plannedDuration, recognizedText: $recognizedText, category: $category, latitude: $latitude, longitude: $longitude, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(_TaskModel value, $Res Function(_TaskModel) _then) = __$TaskModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) DateTime dueDate,@HiveField(4) TaskPriority priority,@HiveField(5) bool isCompleted,@HiveField(6) List<String> imageUrls,@HiveField(7) List<MilestoneModel> milestones,@HiveField(8) int totalFocusTime,@HiveField(9) int actualFocusTime,@HiveField(10)@JsonKey(defaultValue: 0) int interruptions,@HiveField(11)@JsonKey(defaultValue: 25) int plannedDuration,@HiveField(12) String? recognizedText,@HiveField(13) String? category,@HiveField(14) double? latitude,@HiveField(15) double? longitude,@HiveField(16) String? userId
});




}
/// @nodoc
class __$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? priority = null,Object? isCompleted = null,Object? imageUrls = null,Object? milestones = null,Object? totalFocusTime = null,Object? actualFocusTime = null,Object? interruptions = null,Object? plannedDuration = null,Object? recognizedText = freezed,Object? category = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? userId = freezed,}) {
  return _then(_TaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,milestones: null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<MilestoneModel>,totalFocusTime: null == totalFocusTime ? _self.totalFocusTime : totalFocusTime // ignore: cast_nullable_to_non_nullable
as int,actualFocusTime: null == actualFocusTime ? _self.actualFocusTime : actualFocusTime // ignore: cast_nullable_to_non_nullable
as int,interruptions: null == interruptions ? _self.interruptions : interruptions // ignore: cast_nullable_to_non_nullable
as int,plannedDuration: null == plannedDuration ? _self.plannedDuration : plannedDuration // ignore: cast_nullable_to_non_nullable
as int,recognizedText: freezed == recognizedText ? _self.recognizedText : recognizedText // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
