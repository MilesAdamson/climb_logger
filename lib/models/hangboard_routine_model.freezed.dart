// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hangboard_routine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HangboardRoutineModel _$HangboardRoutineModelFromJson(
    Map<String, dynamic> json) {
  return _HangboardRoutineModel.fromJson(json);
}

/// @nodoc
class _$HangboardRoutineModelTearOff {
  const _$HangboardRoutineModelTearOff();

  _HangboardRoutineModel call(
      String name,
      @TimestampConverter()
          DateTime createdAt,
      @JsonKey(defaultValue: 100)
          int score,
      @JsonKey(defaultValue: 1)
          int sets,
      @JsonKey(defaultValue: 1)
          int restBetweenSetsMinutes,
      @JsonKey(defaultValue: 0)
          int restBetweenSetsSeconds,
      @JsonKey(fromJson: HangboardRoutineModel.setDefinitionFromJson, toJson: HangboardRoutineModel.setDefinitionToJson)
          List<HangboardItemModel> items) {
    return _HangboardRoutineModel(
      name,
      createdAt,
      score,
      sets,
      restBetweenSetsMinutes,
      restBetweenSetsSeconds,
      items,
    );
  }

  HangboardRoutineModel fromJson(Map<String, Object?> json) {
    return HangboardRoutineModel.fromJson(json);
  }
}

/// @nodoc
const $HangboardRoutineModel = _$HangboardRoutineModelTearOff();

/// @nodoc
mixin _$HangboardRoutineModel {
  String get name => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 100)
  int get score => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 1)
  int get sets => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 1)
  int get restBetweenSetsMinutes => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get restBetweenSetsSeconds => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: HangboardRoutineModel.setDefinitionFromJson,
      toJson: HangboardRoutineModel.setDefinitionToJson)
  List<HangboardItemModel> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HangboardRoutineModelCopyWith<HangboardRoutineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangboardRoutineModelCopyWith<$Res> {
  factory $HangboardRoutineModelCopyWith(HangboardRoutineModel value,
          $Res Function(HangboardRoutineModel) then) =
      _$HangboardRoutineModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      @TimestampConverter()
          DateTime createdAt,
      @JsonKey(defaultValue: 100)
          int score,
      @JsonKey(defaultValue: 1)
          int sets,
      @JsonKey(defaultValue: 1)
          int restBetweenSetsMinutes,
      @JsonKey(defaultValue: 0)
          int restBetweenSetsSeconds,
      @JsonKey(fromJson: HangboardRoutineModel.setDefinitionFromJson, toJson: HangboardRoutineModel.setDefinitionToJson)
          List<HangboardItemModel> items});
}

/// @nodoc
class _$HangboardRoutineModelCopyWithImpl<$Res>
    implements $HangboardRoutineModelCopyWith<$Res> {
  _$HangboardRoutineModelCopyWithImpl(this._value, this._then);

  final HangboardRoutineModel _value;
  // ignore: unused_field
  final $Res Function(HangboardRoutineModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? score = freezed,
    Object? sets = freezed,
    Object? restBetweenSetsMinutes = freezed,
    Object? restBetweenSetsSeconds = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      sets: sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      restBetweenSetsMinutes: restBetweenSetsMinutes == freezed
          ? _value.restBetweenSetsMinutes
          : restBetweenSetsMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      restBetweenSetsSeconds: restBetweenSetsSeconds == freezed
          ? _value.restBetweenSetsSeconds
          : restBetweenSetsSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HangboardItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$HangboardRoutineModelCopyWith<$Res>
    implements $HangboardRoutineModelCopyWith<$Res> {
  factory _$HangboardRoutineModelCopyWith(_HangboardRoutineModel value,
          $Res Function(_HangboardRoutineModel) then) =
      __$HangboardRoutineModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      @TimestampConverter()
          DateTime createdAt,
      @JsonKey(defaultValue: 100)
          int score,
      @JsonKey(defaultValue: 1)
          int sets,
      @JsonKey(defaultValue: 1)
          int restBetweenSetsMinutes,
      @JsonKey(defaultValue: 0)
          int restBetweenSetsSeconds,
      @JsonKey(fromJson: HangboardRoutineModel.setDefinitionFromJson, toJson: HangboardRoutineModel.setDefinitionToJson)
          List<HangboardItemModel> items});
}

/// @nodoc
class __$HangboardRoutineModelCopyWithImpl<$Res>
    extends _$HangboardRoutineModelCopyWithImpl<$Res>
    implements _$HangboardRoutineModelCopyWith<$Res> {
  __$HangboardRoutineModelCopyWithImpl(_HangboardRoutineModel _value,
      $Res Function(_HangboardRoutineModel) _then)
      : super(_value, (v) => _then(v as _HangboardRoutineModel));

  @override
  _HangboardRoutineModel get _value => super._value as _HangboardRoutineModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? score = freezed,
    Object? sets = freezed,
    Object? restBetweenSetsMinutes = freezed,
    Object? restBetweenSetsSeconds = freezed,
    Object? items = freezed,
  }) {
    return _then(_HangboardRoutineModel(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      sets == freezed
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      restBetweenSetsMinutes == freezed
          ? _value.restBetweenSetsMinutes
          : restBetweenSetsMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      restBetweenSetsSeconds == freezed
          ? _value.restBetweenSetsSeconds
          : restBetweenSetsSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<HangboardItemModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HangboardRoutineModel extends _HangboardRoutineModel {
  _$_HangboardRoutineModel(
      this.name,
      @TimestampConverter()
          this.createdAt,
      @JsonKey(defaultValue: 100)
          this.score,
      @JsonKey(defaultValue: 1)
          this.sets,
      @JsonKey(defaultValue: 1)
          this.restBetweenSetsMinutes,
      @JsonKey(defaultValue: 0)
          this.restBetweenSetsSeconds,
      @JsonKey(fromJson: HangboardRoutineModel.setDefinitionFromJson, toJson: HangboardRoutineModel.setDefinitionToJson)
          this.items)
      : super._();

  factory _$_HangboardRoutineModel.fromJson(Map<String, dynamic> json) =>
      _$$_HangboardRoutineModelFromJson(json);

  @override
  final String name;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @JsonKey(defaultValue: 100)
  final int score;
  @override
  @JsonKey(defaultValue: 1)
  final int sets;
  @override
  @JsonKey(defaultValue: 1)
  final int restBetweenSetsMinutes;
  @override
  @JsonKey(defaultValue: 0)
  final int restBetweenSetsSeconds;
  @override
  @JsonKey(
      fromJson: HangboardRoutineModel.setDefinitionFromJson,
      toJson: HangboardRoutineModel.setDefinitionToJson)
  final List<HangboardItemModel> items;

  @override
  String toString() {
    return 'HangboardRoutineModel(name: $name, createdAt: $createdAt, score: $score, sets: $sets, restBetweenSetsMinutes: $restBetweenSetsMinutes, restBetweenSetsSeconds: $restBetweenSetsSeconds, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HangboardRoutineModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.sets, sets) &&
            const DeepCollectionEquality()
                .equals(other.restBetweenSetsMinutes, restBetweenSetsMinutes) &&
            const DeepCollectionEquality()
                .equals(other.restBetweenSetsSeconds, restBetweenSetsSeconds) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(sets),
      const DeepCollectionEquality().hash(restBetweenSetsMinutes),
      const DeepCollectionEquality().hash(restBetweenSetsSeconds),
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$HangboardRoutineModelCopyWith<_HangboardRoutineModel> get copyWith =>
      __$HangboardRoutineModelCopyWithImpl<_HangboardRoutineModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HangboardRoutineModelToJson(this);
  }
}

abstract class _HangboardRoutineModel extends HangboardRoutineModel {
  factory _HangboardRoutineModel(
      String name,
      @TimestampConverter()
          DateTime createdAt,
      @JsonKey(defaultValue: 100)
          int score,
      @JsonKey(defaultValue: 1)
          int sets,
      @JsonKey(defaultValue: 1)
          int restBetweenSetsMinutes,
      @JsonKey(defaultValue: 0)
          int restBetweenSetsSeconds,
      @JsonKey(fromJson: HangboardRoutineModel.setDefinitionFromJson, toJson: HangboardRoutineModel.setDefinitionToJson)
          List<HangboardItemModel> items) = _$_HangboardRoutineModel;
  _HangboardRoutineModel._() : super._();

  factory _HangboardRoutineModel.fromJson(Map<String, dynamic> json) =
      _$_HangboardRoutineModel.fromJson;

  @override
  String get name;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(defaultValue: 100)
  int get score;
  @override
  @JsonKey(defaultValue: 1)
  int get sets;
  @override
  @JsonKey(defaultValue: 1)
  int get restBetweenSetsMinutes;
  @override
  @JsonKey(defaultValue: 0)
  int get restBetweenSetsSeconds;
  @override
  @JsonKey(
      fromJson: HangboardRoutineModel.setDefinitionFromJson,
      toJson: HangboardRoutineModel.setDefinitionToJson)
  List<HangboardItemModel> get items;
  @override
  @JsonKey(ignore: true)
  _$HangboardRoutineModelCopyWith<_HangboardRoutineModel> get copyWith =>
      throw _privateConstructorUsedError;
}
