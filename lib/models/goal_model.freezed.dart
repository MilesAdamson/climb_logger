// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'goal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) {
  return _GoalModel.fromJson(json);
}

/// @nodoc
class _$GoalModelTearOff {
  const _$GoalModelTearOff();

  _GoalModel call(
      List<ObjectiveModel> objectives,
      @TimestampConverter() DateTime endDateGoal,
      @TimestampConverter() DateTime createdAt) {
    return _GoalModel(
      objectives,
      endDateGoal,
      createdAt,
    );
  }

  GoalModel fromJson(Map<String, Object?> json) {
    return GoalModel.fromJson(json);
  }
}

/// @nodoc
const $GoalModel = _$GoalModelTearOff();

/// @nodoc
mixin _$GoalModel {
  List<ObjectiveModel> get objectives => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get endDateGoal => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoalModelCopyWith<GoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalModelCopyWith<$Res> {
  factory $GoalModelCopyWith(GoalModel value, $Res Function(GoalModel) then) =
      _$GoalModelCopyWithImpl<$Res>;
  $Res call(
      {List<ObjectiveModel> objectives,
      @TimestampConverter() DateTime endDateGoal,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$GoalModelCopyWithImpl<$Res> implements $GoalModelCopyWith<$Res> {
  _$GoalModelCopyWithImpl(this._value, this._then);

  final GoalModel _value;
  // ignore: unused_field
  final $Res Function(GoalModel) _then;

  @override
  $Res call({
    Object? objectives = freezed,
    Object? endDateGoal = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      objectives: objectives == freezed
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<ObjectiveModel>,
      endDateGoal: endDateGoal == freezed
          ? _value.endDateGoal
          : endDateGoal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$GoalModelCopyWith<$Res> implements $GoalModelCopyWith<$Res> {
  factory _$GoalModelCopyWith(
          _GoalModel value, $Res Function(_GoalModel) then) =
      __$GoalModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ObjectiveModel> objectives,
      @TimestampConverter() DateTime endDateGoal,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$GoalModelCopyWithImpl<$Res> extends _$GoalModelCopyWithImpl<$Res>
    implements _$GoalModelCopyWith<$Res> {
  __$GoalModelCopyWithImpl(_GoalModel _value, $Res Function(_GoalModel) _then)
      : super(_value, (v) => _then(v as _GoalModel));

  @override
  _GoalModel get _value => super._value as _GoalModel;

  @override
  $Res call({
    Object? objectives = freezed,
    Object? endDateGoal = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_GoalModel(
      objectives == freezed
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<ObjectiveModel>,
      endDateGoal == freezed
          ? _value.endDateGoal
          : endDateGoal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_GoalModel extends _GoalModel with DiagnosticableTreeMixin {
  _$_GoalModel(this.objectives, @TimestampConverter() this.endDateGoal,
      @TimestampConverter() this.createdAt)
      : super._();

  factory _$_GoalModel.fromJson(Map<String, dynamic> json) =>
      _$$_GoalModelFromJson(json);

  @override
  final List<ObjectiveModel> objectives;
  @override
  @TimestampConverter()
  final DateTime endDateGoal;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoalModel(objectives: $objectives, endDateGoal: $endDateGoal, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoalModel'))
      ..add(DiagnosticsProperty('objectives', objectives))
      ..add(DiagnosticsProperty('endDateGoal', endDateGoal))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoalModel &&
            const DeepCollectionEquality()
                .equals(other.objectives, objectives) &&
            const DeepCollectionEquality()
                .equals(other.endDateGoal, endDateGoal) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(objectives),
      const DeepCollectionEquality().hash(endDateGoal),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$GoalModelCopyWith<_GoalModel> get copyWith =>
      __$GoalModelCopyWithImpl<_GoalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoalModelToJson(this);
  }
}

abstract class _GoalModel extends GoalModel {
  factory _GoalModel(
      List<ObjectiveModel> objectives,
      @TimestampConverter() DateTime endDateGoal,
      @TimestampConverter() DateTime createdAt) = _$_GoalModel;
  _GoalModel._() : super._();

  factory _GoalModel.fromJson(Map<String, dynamic> json) =
      _$_GoalModel.fromJson;

  @override
  List<ObjectiveModel> get objectives;
  @override
  @TimestampConverter()
  DateTime get endDateGoal;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$GoalModelCopyWith<_GoalModel> get copyWith =>
      throw _privateConstructorUsedError;
}
