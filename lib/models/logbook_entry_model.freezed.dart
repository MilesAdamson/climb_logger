// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'logbook_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogbookEntryModel _$LogbookEntryModelFromJson(Map<String, dynamic> json) {
  return _LogbookEntryModel.fromJson(json);
}

/// @nodoc
class _$LogbookEntryModelTearOff {
  const _$LogbookEntryModelTearOff();

  _LogbookEntryModel call(
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime,
      String? details,
      String? climbName,
      @JsonKey(defaultValue: "?")
          String gradeLabel,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: <String>[])
          List<String> tags,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      int? attempts) {
    return _LogbookEntryModel(
      dateTime,
      details,
      climbName,
      gradeLabel,
      climbType,
      ascentType,
      tags,
      wallType,
      attempts,
    );
  }

  LogbookEntryModel fromJson(Map<String, Object?> json) {
    return LogbookEntryModel.fromJson(json);
  }
}

/// @nodoc
const $LogbookEntryModel = _$LogbookEntryModelTearOff();

/// @nodoc
mixin _$LogbookEntryModel {
  @TimestampConverter()
  @JsonKey(name: LogbookEntryModel.keyTimestamp)
  DateTime get dateTime => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get climbName => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "?")
  String get gradeLabel => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: AscentType.redpoint)
  AscentType get ascentType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: WallType.overhang)
  WallType get wallType => throw _privateConstructorUsedError;
  int? get attempts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogbookEntryModelCopyWith<LogbookEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogbookEntryModelCopyWith<$Res> {
  factory $LogbookEntryModelCopyWith(
          LogbookEntryModel value, $Res Function(LogbookEntryModel) then) =
      _$LogbookEntryModelCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime,
      String? details,
      String? climbName,
      @JsonKey(defaultValue: "?")
          String gradeLabel,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: <String>[])
          List<String> tags,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      int? attempts});
}

/// @nodoc
class _$LogbookEntryModelCopyWithImpl<$Res>
    implements $LogbookEntryModelCopyWith<$Res> {
  _$LogbookEntryModelCopyWithImpl(this._value, this._then);

  final LogbookEntryModel _value;
  // ignore: unused_field
  final $Res Function(LogbookEntryModel) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? details = freezed,
    Object? climbName = freezed,
    Object? gradeLabel = freezed,
    Object? climbType = freezed,
    Object? ascentType = freezed,
    Object? tags = freezed,
    Object? wallType = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      climbName: climbName == freezed
          ? _value.climbName
          : climbName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLabel: gradeLabel == freezed
          ? _value.gradeLabel
          : gradeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      climbType: climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      ascentType: ascentType == freezed
          ? _value.ascentType
          : ascentType // ignore: cast_nullable_to_non_nullable
              as AscentType,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wallType: wallType == freezed
          ? _value.wallType
          : wallType // ignore: cast_nullable_to_non_nullable
              as WallType,
      attempts: attempts == freezed
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$LogbookEntryModelCopyWith<$Res>
    implements $LogbookEntryModelCopyWith<$Res> {
  factory _$LogbookEntryModelCopyWith(
          _LogbookEntryModel value, $Res Function(_LogbookEntryModel) then) =
      __$LogbookEntryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime,
      String? details,
      String? climbName,
      @JsonKey(defaultValue: "?")
          String gradeLabel,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: <String>[])
          List<String> tags,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      int? attempts});
}

/// @nodoc
class __$LogbookEntryModelCopyWithImpl<$Res>
    extends _$LogbookEntryModelCopyWithImpl<$Res>
    implements _$LogbookEntryModelCopyWith<$Res> {
  __$LogbookEntryModelCopyWithImpl(
      _LogbookEntryModel _value, $Res Function(_LogbookEntryModel) _then)
      : super(_value, (v) => _then(v as _LogbookEntryModel));

  @override
  _LogbookEntryModel get _value => super._value as _LogbookEntryModel;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? details = freezed,
    Object? climbName = freezed,
    Object? gradeLabel = freezed,
    Object? climbType = freezed,
    Object? ascentType = freezed,
    Object? tags = freezed,
    Object? wallType = freezed,
    Object? attempts = freezed,
  }) {
    return _then(_LogbookEntryModel(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      climbName == freezed
          ? _value.climbName
          : climbName // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLabel == freezed
          ? _value.gradeLabel
          : gradeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      ascentType == freezed
          ? _value.ascentType
          : ascentType // ignore: cast_nullable_to_non_nullable
              as AscentType,
      tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      wallType == freezed
          ? _value.wallType
          : wallType // ignore: cast_nullable_to_non_nullable
              as WallType,
      attempts == freezed
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_LogbookEntryModel extends _LogbookEntryModel {
  _$_LogbookEntryModel(
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          this.dateTime,
      this.details,
      this.climbName,
      @JsonKey(defaultValue: "?")
          this.gradeLabel,
      @JsonKey(defaultValue: ClimbType.boulder)
          this.climbType,
      @JsonKey(defaultValue: AscentType.redpoint)
          this.ascentType,
      @JsonKey(defaultValue: <String>[])
          this.tags,
      @JsonKey(defaultValue: WallType.overhang)
          this.wallType,
      this.attempts)
      : super._();

  factory _$_LogbookEntryModel.fromJson(Map<String, dynamic> json) =>
      _$$_LogbookEntryModelFromJson(json);

  @override
  @TimestampConverter()
  @JsonKey(name: LogbookEntryModel.keyTimestamp)
  final DateTime dateTime;
  @override
  final String? details;
  @override
  final String? climbName;
  @override
  @JsonKey(defaultValue: "?")
  final String gradeLabel;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  final ClimbType climbType;
  @override
  @JsonKey(defaultValue: AscentType.redpoint)
  final AscentType ascentType;
  @override
  @JsonKey(defaultValue: <String>[])
  final List<String> tags;
  @override
  @JsonKey(defaultValue: WallType.overhang)
  final WallType wallType;
  @override
  final int? attempts;

  @override
  String toString() {
    return 'LogbookEntryModel(dateTime: $dateTime, details: $details, climbName: $climbName, gradeLabel: $gradeLabel, climbType: $climbType, ascentType: $ascentType, tags: $tags, wallType: $wallType, attempts: $attempts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LogbookEntryModel &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.details, details) &&
            const DeepCollectionEquality().equals(other.climbName, climbName) &&
            const DeepCollectionEquality()
                .equals(other.gradeLabel, gradeLabel) &&
            const DeepCollectionEquality().equals(other.climbType, climbType) &&
            const DeepCollectionEquality()
                .equals(other.ascentType, ascentType) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.wallType, wallType) &&
            const DeepCollectionEquality().equals(other.attempts, attempts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(details),
      const DeepCollectionEquality().hash(climbName),
      const DeepCollectionEquality().hash(gradeLabel),
      const DeepCollectionEquality().hash(climbType),
      const DeepCollectionEquality().hash(ascentType),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(wallType),
      const DeepCollectionEquality().hash(attempts));

  @JsonKey(ignore: true)
  @override
  _$LogbookEntryModelCopyWith<_LogbookEntryModel> get copyWith =>
      __$LogbookEntryModelCopyWithImpl<_LogbookEntryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogbookEntryModelToJson(this);
  }
}

abstract class _LogbookEntryModel extends LogbookEntryModel {
  factory _LogbookEntryModel(
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime,
      String? details,
      String? climbName,
      @JsonKey(defaultValue: "?")
          String gradeLabel,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: <String>[])
          List<String> tags,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      int? attempts) = _$_LogbookEntryModel;
  _LogbookEntryModel._() : super._();

  factory _LogbookEntryModel.fromJson(Map<String, dynamic> json) =
      _$_LogbookEntryModel.fromJson;

  @override
  @TimestampConverter()
  @JsonKey(name: LogbookEntryModel.keyTimestamp)
  DateTime get dateTime;
  @override
  String? get details;
  @override
  String? get climbName;
  @override
  @JsonKey(defaultValue: "?")
  String get gradeLabel;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType;
  @override
  @JsonKey(defaultValue: AscentType.redpoint)
  AscentType get ascentType;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get tags;
  @override
  @JsonKey(defaultValue: WallType.overhang)
  WallType get wallType;
  @override
  int? get attempts;
  @override
  @JsonKey(ignore: true)
  _$LogbookEntryModelCopyWith<_LogbookEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
