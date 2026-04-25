// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Milestone {

 String get id; String get title; bool get isDone;
/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneCopyWith<Milestone> get copyWith => _$MilestoneCopyWithImpl<Milestone>(this as Milestone, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Milestone&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isDone);

@override
String toString() {
  return 'Milestone(id: $id, title: $title, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class $MilestoneCopyWith<$Res>  {
  factory $MilestoneCopyWith(Milestone value, $Res Function(Milestone) _then) = _$MilestoneCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isDone
});




}
/// @nodoc
class _$MilestoneCopyWithImpl<$Res>
    implements $MilestoneCopyWith<$Res> {
  _$MilestoneCopyWithImpl(this._self, this._then);

  final Milestone _self;
  final $Res Function(Milestone) _then;

/// Create a copy of Milestone
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


/// Adds pattern-matching-related methods to [Milestone].
extension MilestonePatterns on Milestone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Milestone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Milestone value)  $default,){
final _that = this;
switch (_that) {
case _Milestone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Milestone value)?  $default,){
final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool isDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool isDone)  $default,) {final _that = this;
switch (_that) {
case _Milestone():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool isDone)?  $default,) {final _that = this;
switch (_that) {
case _Milestone() when $default != null:
return $default(_that.id,_that.title,_that.isDone);case _:
  return null;

}
}

}

/// @nodoc


class _Milestone implements Milestone {
  const _Milestone({required this.id, required this.title, this.isDone = false});
  

@override final  String id;
@override final  String title;
@override@JsonKey() final  bool isDone;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneCopyWith<_Milestone> get copyWith => __$MilestoneCopyWithImpl<_Milestone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Milestone&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isDone);

@override
String toString() {
  return 'Milestone(id: $id, title: $title, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$MilestoneCopyWith<$Res> implements $MilestoneCopyWith<$Res> {
  factory _$MilestoneCopyWith(_Milestone value, $Res Function(_Milestone) _then) = __$MilestoneCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isDone
});




}
/// @nodoc
class __$MilestoneCopyWithImpl<$Res>
    implements _$MilestoneCopyWith<$Res> {
  __$MilestoneCopyWithImpl(this._self, this._then);

  final _Milestone _self;
  final $Res Function(_Milestone) _then;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isDone = null,}) {
  return _then(_Milestone(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TaskEntity {

 String get id; String get title; String get description; DateTime get dueDate; TaskPriority get priority; bool get isCompleted; List<String> get imageUrls; List<Milestone> get milestones; int get totalFocusTime; int get actualFocusTime; int get interruptions; int get plannedDuration; String? get recognizedText; String? get category; double? get latitude; double? get longitude; String? get userId;
/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskEntityCopyWith<TaskEntity> get copyWith => _$TaskEntityCopyWithImpl<TaskEntity>(this as TaskEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&const DeepCollectionEquality().equals(other.milestones, milestones)&&(identical(other.totalFocusTime, totalFocusTime) || other.totalFocusTime == totalFocusTime)&&(identical(other.actualFocusTime, actualFocusTime) || other.actualFocusTime == actualFocusTime)&&(identical(other.interruptions, interruptions) || other.interruptions == interruptions)&&(identical(other.plannedDuration, plannedDuration) || other.plannedDuration == plannedDuration)&&(identical(other.recognizedText, recognizedText) || other.recognizedText == recognizedText)&&(identical(other.category, category) || other.category == category)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,priority,isCompleted,const DeepCollectionEquality().hash(imageUrls),const DeepCollectionEquality().hash(milestones),totalFocusTime,actualFocusTime,interruptions,plannedDuration,recognizedText,category,latitude,longitude,userId);

@override
String toString() {
  return 'TaskEntity(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, isCompleted: $isCompleted, imageUrls: $imageUrls, milestones: $milestones, totalFocusTime: $totalFocusTime, actualFocusTime: $actualFocusTime, interruptions: $interruptions, plannedDuration: $plannedDuration, recognizedText: $recognizedText, category: $category, latitude: $latitude, longitude: $longitude, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res>  {
  factory $TaskEntityCopyWith(TaskEntity value, $Res Function(TaskEntity) _then) = _$TaskEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, DateTime dueDate, TaskPriority priority, bool isCompleted, List<String> imageUrls, List<Milestone> milestones, int totalFocusTime, int actualFocusTime, int interruptions, int plannedDuration, String? recognizedText, String? category, double? latitude, double? longitude, String? userId
});




}
/// @nodoc
class _$TaskEntityCopyWithImpl<$Res>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._self, this._then);

  final TaskEntity _self;
  final $Res Function(TaskEntity) _then;

/// Create a copy of TaskEntity
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
as List<Milestone>,totalFocusTime: null == totalFocusTime ? _self.totalFocusTime : totalFocusTime // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [TaskEntity].
extension TaskEntityPatterns on TaskEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskEntity value)  $default,){
final _that = this;
switch (_that) {
case _TaskEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime dueDate,  TaskPriority priority,  bool isCompleted,  List<String> imageUrls,  List<Milestone> milestones,  int totalFocusTime,  int actualFocusTime,  int interruptions,  int plannedDuration,  String? recognizedText,  String? category,  double? latitude,  double? longitude,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  DateTime dueDate,  TaskPriority priority,  bool isCompleted,  List<String> imageUrls,  List<Milestone> milestones,  int totalFocusTime,  int actualFocusTime,  int interruptions,  int plannedDuration,  String? recognizedText,  String? category,  double? latitude,  double? longitude,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _TaskEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  DateTime dueDate,  TaskPriority priority,  bool isCompleted,  List<String> imageUrls,  List<Milestone> milestones,  int totalFocusTime,  int actualFocusTime,  int interruptions,  int plannedDuration,  String? recognizedText,  String? category,  double? latitude,  double? longitude,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _TaskEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.dueDate,_that.priority,_that.isCompleted,_that.imageUrls,_that.milestones,_that.totalFocusTime,_that.actualFocusTime,_that.interruptions,_that.plannedDuration,_that.recognizedText,_that.category,_that.latitude,_that.longitude,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _TaskEntity extends TaskEntity {
  const _TaskEntity({required this.id, required this.title, required this.description, required this.dueDate, this.priority = TaskPriority.medium, this.isCompleted = false, final  List<String> imageUrls = const [], final  List<Milestone> milestones = const [], this.totalFocusTime = 0, this.actualFocusTime = 0, this.interruptions = 0, this.plannedDuration = 25, this.recognizedText, this.category, this.latitude, this.longitude, this.userId}): _imageUrls = imageUrls,_milestones = milestones,super._();
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  DateTime dueDate;
@override@JsonKey() final  TaskPriority priority;
@override@JsonKey() final  bool isCompleted;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

 final  List<Milestone> _milestones;
@override@JsonKey() List<Milestone> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}

@override@JsonKey() final  int totalFocusTime;
@override@JsonKey() final  int actualFocusTime;
@override@JsonKey() final  int interruptions;
@override@JsonKey() final  int plannedDuration;
@override final  String? recognizedText;
@override final  String? category;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? userId;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskEntityCopyWith<_TaskEntity> get copyWith => __$TaskEntityCopyWithImpl<_TaskEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&const DeepCollectionEquality().equals(other._milestones, _milestones)&&(identical(other.totalFocusTime, totalFocusTime) || other.totalFocusTime == totalFocusTime)&&(identical(other.actualFocusTime, actualFocusTime) || other.actualFocusTime == actualFocusTime)&&(identical(other.interruptions, interruptions) || other.interruptions == interruptions)&&(identical(other.plannedDuration, plannedDuration) || other.plannedDuration == plannedDuration)&&(identical(other.recognizedText, recognizedText) || other.recognizedText == recognizedText)&&(identical(other.category, category) || other.category == category)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,priority,isCompleted,const DeepCollectionEquality().hash(_imageUrls),const DeepCollectionEquality().hash(_milestones),totalFocusTime,actualFocusTime,interruptions,plannedDuration,recognizedText,category,latitude,longitude,userId);

@override
String toString() {
  return 'TaskEntity(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, isCompleted: $isCompleted, imageUrls: $imageUrls, milestones: $milestones, totalFocusTime: $totalFocusTime, actualFocusTime: $actualFocusTime, interruptions: $interruptions, plannedDuration: $plannedDuration, recognizedText: $recognizedText, category: $category, latitude: $latitude, longitude: $longitude, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$TaskEntityCopyWith<$Res> implements $TaskEntityCopyWith<$Res> {
  factory _$TaskEntityCopyWith(_TaskEntity value, $Res Function(_TaskEntity) _then) = __$TaskEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, DateTime dueDate, TaskPriority priority, bool isCompleted, List<String> imageUrls, List<Milestone> milestones, int totalFocusTime, int actualFocusTime, int interruptions, int plannedDuration, String? recognizedText, String? category, double? latitude, double? longitude, String? userId
});




}
/// @nodoc
class __$TaskEntityCopyWithImpl<$Res>
    implements _$TaskEntityCopyWith<$Res> {
  __$TaskEntityCopyWithImpl(this._self, this._then);

  final _TaskEntity _self;
  final $Res Function(_TaskEntity) _then;

/// Create a copy of TaskEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? priority = null,Object? isCompleted = null,Object? imageUrls = null,Object? milestones = null,Object? totalFocusTime = null,Object? actualFocusTime = null,Object? interruptions = null,Object? plannedDuration = null,Object? recognizedText = freezed,Object? category = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? userId = freezed,}) {
  return _then(_TaskEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,milestones: null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,totalFocusTime: null == totalFocusTime ? _self.totalFocusTime : totalFocusTime // ignore: cast_nullable_to_non_nullable
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
