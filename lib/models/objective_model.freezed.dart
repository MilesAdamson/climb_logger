// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'objective_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ObjectiveModel _$ObjectiveModelFromJson(Map<String, dynamic> json) {
  return _ObjectiveModel.fromJson(json);
}

/// @nodoc
class _$ObjectiveModelTearOff {
  const _$ObjectiveModelTearOff();

  _ObjectiveModel call(
      @JsonKey(defaultValue: 0) int targetCount,
      @JsonKey(defaultValue: 0) int countCompleted,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
      @JsonKey(defaultValue: "?") String gradeLabel,
      @JsonKey(defaultValue: false) bool exactGradesOnly,
      String? tag) {
    return _ObjectiveModel(
      targetCount,
      countCompleted,
      climbType,
      ascentType,
      gradeLabel,
      exactGradesOnly,
      tag,
    );
  }

  ObjectiveModel fromJson(Map<String, Object?> json) {
    return ObjectiveModel.fromJson(json);
  }
}

/// @nodoc
const $ObjectiveModel = _$ObjectiveModelTearOff();

/// @nodoc
mixin _$ObjectiveModel {
  @JsonKey(defaultValue: 0)
  int get targetCount => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get countCompleted => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: AscentType.redpoint)
  AscentType get ascentType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "?")
  String get gradeLabel => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get exactGradesOnly => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ObjectiveModelCopyWith<ObjectiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObjectiveModelCopyWith<$Res> {
  factory $ObjectiveModelCopyWith(
          ObjectiveModel value, $Res Function(ObjectiveModel) then) =
      _$ObjectiveModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: 0) int targetCount,
      @JsonKey(defaultValue: 0) int countCompleted,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
      @JsonKey(defaultValue: "?") String gradeLabel,
      @JsonKey(defaultValue: false) bool exactGradesOnly,
      String? tag});
}

/// @nodoc
class _$ObjectiveModelCopyWithImpl<$Res>
    implements $ObjectiveModelCopyWith<$Res> {
  _$ObjectiveModelCopyWithImpl(this._value, this._then);

  final ObjectiveModel _value;
  // ignore: unused_field
  final $Res Function(ObjectiveModel) _then;

  @override
  $Res call({
    Object? targetCount = freezed,
    Object? countCompleted = freezed,
    Object? climbType = freezed,
    Object? ascentType = freezed,
    Object? gradeLabel = freezed,
    Object? exactGradesOnly = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      targetCount: targetCount == freezed
          ? _value.targetCount
          : targetCount // ignore: cast_nullable_to_non_nullable
              as int,
      countCompleted: countCompleted == freezed
          ? _value.countCompleted
          : countCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      climbType: climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      ascentType: ascentType == freezed
          ? _value.ascentType
          : ascentType // ignore: cast_nullable_to_non_nullable
              as AscentType,
      gradeLabel: gradeLabel == freezed
          ? _value.gradeLabel
          : gradeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      exactGradesOnly: exactGradesOnly == freezed
          ? _value.exactGradesOnly
          : exactGradesOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ObjectiveModelCopyWith<$Res>
    implements $ObjectiveModelCopyWith<$Res> {
  factory _$ObjectiveModelCopyWith(
          _ObjectiveModel value, $Res Function(_ObjectiveModel) then) =
      __$ObjectiveModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: 0) int targetCount,
      @JsonKey(defaultValue: 0) int countCompleted,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
      @JsonKey(defaultValue: "?") String gradeLabel,
      @JsonKey(defaultValue: false) bool exactGradesOnly,
      String? tag});
}

/// @nodoc
class __$ObjectiveModelCopyWithImpl<$Res>
    extends _$ObjectiveModelCopyWithImpl<$Res>
    implements _$ObjectiveModelCopyWith<$Res> {
  __$ObjectiveModelCopyWithImpl(
      _ObjectiveModel _value, $Res Function(_ObjectiveModel) _then)
      : super(_value, (v) => _then(v as _ObjectiveModel));

  @override
  _ObjectiveModel get _value => super._value as _ObjectiveModel;

  @override
  $Res call({
    Object? targetCount = freezed,
    Object? countCompleted = freezed,
    Object? climbType = freezed,
    Object? ascentType = freezed,
    Object? gradeLabel = freezed,
    Object? exactGradesOnly = freezed,
    Object? tag = freezed,
  }) {
    return _then(_ObjectiveModel(
      targetCount == freezed
          ? _value.targetCount
          : targetCount // ignore: cast_nullable_to_non_nullable
              as int,
      countCompleted == freezed
          ? _value.countCompleted
          : countCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      ascentType == freezed
          ? _value.ascentType
          : ascentType // ignore: cast_nullable_to_non_nullable
              as AscentType,
      gradeLabel == freezed
          ? _value.gradeLabel
          : gradeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      exactGradesOnly == freezed
          ? _value.exactGradesOnly
          : exactGradesOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ObjectiveModel extends _ObjectiveModel {
  _$_ObjectiveModel(
      @JsonKey(defaultValue: 0) this.targetCount,
      @JsonKey(defaultValue: 0) this.countCompleted,
      @JsonKey(defaultValue: ClimbType.boulder) this.climbType,
      @JsonKey(defaultValue: AscentType.redpoint) this.ascentType,
      @JsonKey(defaultValue: "?") this.gradeLabel,
      @JsonKey(defaultValue: false) this.exactGradesOnly,
      this.tag)
      : super._();

  factory _$_ObjectiveModel.fromJson(Map<String, dynamic> json) =>
      _$$_ObjectiveModelFromJson(json);

  @override
  @JsonKey(defaultValue: 0)
  final int targetCount;
  @override
  @JsonKey(defaultValue: 0)
  final int countCompleted;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  final ClimbType climbType;
  @override
  @JsonKey(defaultValue: AscentType.redpoint)
  final AscentType ascentType;
  @override
  @JsonKey(defaultValue: "?")
  final String gradeLabel;
  @override
  @JsonKey(defaultValue: false)
  final bool exactGradesOnly;
  @override
  final String? tag;

  @override
  String toString() {
    return 'ObjectiveModel(targetCount: $targetCount, countCompleted: $countCompleted, climbType: $climbType, ascentType: $ascentType, gradeLabel: $gradeLabel, exactGradesOnly: $exactGradesOnly, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ObjectiveModel &&
            const DeepCollectionEquality()
                .equals(other.targetCount, targetCount) &&
            const DeepCollectionEquality()
                .equals(other.countCompleted, countCompleted) &&
            const DeepCollectionEquality().equals(other.climbType, climbType) &&
            const DeepCollectionEquality()
                .equals(other.ascentType, ascentType) &&
            const DeepCollectionEquality()
                .equals(other.gradeLabel, gradeLabel) &&
            const DeepCollectionEquality()
                .equals(other.exactGradesOnly, exactGradesOnly) &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(targetCount),
      const DeepCollectionEquality().hash(countCompleted),
      const DeepCollectionEquality().hash(climbType),
      const DeepCollectionEquality().hash(ascentType),
      const DeepCollectionEquality().hash(gradeLabel),
      const DeepCollectionEquality().hash(exactGradesOnly),
      const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  _$ObjectiveModelCopyWith<_ObjectiveModel> get copyWith =>
      __$ObjectiveModelCopyWithImpl<_ObjectiveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObjectiveModelToJson(this);
  }
}

abstract class _ObjectiveModel extends ObjectiveModel {
  factory _ObjectiveModel(
      @JsonKey(defaultValue: 0) int targetCount,
      @JsonKey(defaultValue: 0) int countCompleted,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
      @JsonKey(defaultValue: "?") String gradeLabel,
      @JsonKey(defaultValue: false) bool exactGradesOnly,
      String? tag) = _$_ObjectiveModel;
  _ObjectiveModel._() : super._();

  factory _ObjectiveModel.fromJson(Map<String, dynamic> json) =
      _$_ObjectiveModel.fromJson;

  @override
  @JsonKey(defaultValue: 0)
  int get targetCount;
  @override
  @JsonKey(defaultValue: 0)
  int get countCompleted;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType;
  @override
  @JsonKey(defaultValue: AscentType.redpoint)
  AscentType get ascentType;
  @override
  @JsonKey(defaultValue: "?")
  String get gradeLabel;
  @override
  @JsonKey(defaultValue: false)
  bool get exactGradesOnly;
  @override
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$ObjectiveModelCopyWith<_ObjectiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
