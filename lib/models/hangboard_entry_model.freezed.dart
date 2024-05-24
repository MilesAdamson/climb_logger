// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hangboard_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HangboardEntryModel _$HangboardEntryModelFromJson(Map<String, dynamic> json) {
  return _HangboardEntryModel.fromJson(json);
}

/// @nodoc
class _$HangboardEntryModelTearOff {
  const _$HangboardEntryModelTearOff();

  _HangboardEntryModel call(
      HangboardRoutineModel hangboardRoutine,
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime) {
    return _HangboardEntryModel(
      hangboardRoutine,
      dateTime,
    );
  }

  HangboardEntryModel fromJson(Map<String, Object?> json) {
    return HangboardEntryModel.fromJson(json);
  }
}

/// @nodoc
const $HangboardEntryModel = _$HangboardEntryModelTearOff();

/// @nodoc
mixin _$HangboardEntryModel {
  HangboardRoutineModel get hangboardRoutine =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  @JsonKey(name: LogbookEntryModel.keyTimestamp)
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HangboardEntryModelCopyWith<HangboardEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangboardEntryModelCopyWith<$Res> {
  factory $HangboardEntryModelCopyWith(
          HangboardEntryModel value, $Res Function(HangboardEntryModel) then) =
      _$HangboardEntryModelCopyWithImpl<$Res>;
  $Res call(
      {HangboardRoutineModel hangboardRoutine,
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime});

  $HangboardRoutineModelCopyWith<$Res> get hangboardRoutine;
}

/// @nodoc
class _$HangboardEntryModelCopyWithImpl<$Res>
    implements $HangboardEntryModelCopyWith<$Res> {
  _$HangboardEntryModelCopyWithImpl(this._value, this._then);

  final HangboardEntryModel _value;
  // ignore: unused_field
  final $Res Function(HangboardEntryModel) _then;

  @override
  $Res call({
    Object? hangboardRoutine = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      hangboardRoutine: hangboardRoutine == freezed
          ? _value.hangboardRoutine
          : hangboardRoutine // ignore: cast_nullable_to_non_nullable
              as HangboardRoutineModel,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $HangboardRoutineModelCopyWith<$Res> get hangboardRoutine {
    return $HangboardRoutineModelCopyWith<$Res>(_value.hangboardRoutine,
        (value) {
      return _then(_value.copyWith(hangboardRoutine: value));
    });
  }
}

/// @nodoc
abstract class _$HangboardEntryModelCopyWith<$Res>
    implements $HangboardEntryModelCopyWith<$Res> {
  factory _$HangboardEntryModelCopyWith(_HangboardEntryModel value,
          $Res Function(_HangboardEntryModel) then) =
      __$HangboardEntryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {HangboardRoutineModel hangboardRoutine,
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime});

  @override
  $HangboardRoutineModelCopyWith<$Res> get hangboardRoutine;
}

/// @nodoc
class __$HangboardEntryModelCopyWithImpl<$Res>
    extends _$HangboardEntryModelCopyWithImpl<$Res>
    implements _$HangboardEntryModelCopyWith<$Res> {
  __$HangboardEntryModelCopyWithImpl(
      _HangboardEntryModel _value, $Res Function(_HangboardEntryModel) _then)
      : super(_value, (v) => _then(v as _HangboardEntryModel));

  @override
  _HangboardEntryModel get _value => super._value as _HangboardEntryModel;

  @override
  $Res call({
    Object? hangboardRoutine = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_HangboardEntryModel(
      hangboardRoutine == freezed
          ? _value.hangboardRoutine
          : hangboardRoutine // ignore: cast_nullable_to_non_nullable
              as HangboardRoutineModel,
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HangboardEntryModel extends _HangboardEntryModel {
  _$_HangboardEntryModel(
      this.hangboardRoutine,
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          this.dateTime)
      : super._();

  factory _$_HangboardEntryModel.fromJson(Map<String, dynamic> json) =>
      _$$_HangboardEntryModelFromJson(json);

  @override
  final HangboardRoutineModel hangboardRoutine;
  @override
  @TimestampConverter()
  @JsonKey(name: LogbookEntryModel.keyTimestamp)
  final DateTime dateTime;

  @override
  String toString() {
    return 'HangboardEntryModel(hangboardRoutine: $hangboardRoutine, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HangboardEntryModel &&
            const DeepCollectionEquality()
                .equals(other.hangboardRoutine, hangboardRoutine) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hangboardRoutine),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$HangboardEntryModelCopyWith<_HangboardEntryModel> get copyWith =>
      __$HangboardEntryModelCopyWithImpl<_HangboardEntryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HangboardEntryModelToJson(this);
  }
}

abstract class _HangboardEntryModel extends HangboardEntryModel {
  factory _HangboardEntryModel(
      HangboardRoutineModel hangboardRoutine,
      @TimestampConverter()
      @JsonKey(name: LogbookEntryModel.keyTimestamp)
          DateTime dateTime) = _$_HangboardEntryModel;
  _HangboardEntryModel._() : super._();

  factory _HangboardEntryModel.fromJson(Map<String, dynamic> json) =
      _$_HangboardEntryModel.fromJson;

  @override
  HangboardRoutineModel get hangboardRoutine;
  @override
  @TimestampConverter()
  @JsonKey(name: LogbookEntryModel.keyTimestamp)
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$HangboardEntryModelCopyWith<_HangboardEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
