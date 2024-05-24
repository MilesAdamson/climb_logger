// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'training_notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrainingNotesModel _$TrainingNotesModelFromJson(Map<String, dynamic> json) {
  return _TrainingNotesModel.fromJson(json);
}

/// @nodoc
class _$TrainingNotesModelTearOff {
  const _$TrainingNotesModelTearOff();

  _TrainingNotesModel call(DateTime dateTime, String? notes, Sentiment? mood,
      Sentiment? sleep, Sentiment? stress, Sentiment? diet, Sentiment? energy) {
    return _TrainingNotesModel(
      dateTime,
      notes,
      mood,
      sleep,
      stress,
      diet,
      energy,
    );
  }

  TrainingNotesModel fromJson(Map<String, Object?> json) {
    return TrainingNotesModel.fromJson(json);
  }
}

/// @nodoc
const $TrainingNotesModel = _$TrainingNotesModelTearOff();

/// @nodoc
mixin _$TrainingNotesModel {
  DateTime get dateTime => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Sentiment? get mood => throw _privateConstructorUsedError;
  Sentiment? get sleep => throw _privateConstructorUsedError;
  Sentiment? get stress => throw _privateConstructorUsedError;
  Sentiment? get diet => throw _privateConstructorUsedError;
  Sentiment? get energy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingNotesModelCopyWith<TrainingNotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingNotesModelCopyWith<$Res> {
  factory $TrainingNotesModelCopyWith(
          TrainingNotesModel value, $Res Function(TrainingNotesModel) then) =
      _$TrainingNotesModelCopyWithImpl<$Res>;
  $Res call(
      {DateTime dateTime,
      String? notes,
      Sentiment? mood,
      Sentiment? sleep,
      Sentiment? stress,
      Sentiment? diet,
      Sentiment? energy});
}

/// @nodoc
class _$TrainingNotesModelCopyWithImpl<$Res>
    implements $TrainingNotesModelCopyWith<$Res> {
  _$TrainingNotesModelCopyWithImpl(this._value, this._then);

  final TrainingNotesModel _value;
  // ignore: unused_field
  final $Res Function(TrainingNotesModel) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? notes = freezed,
    Object? mood = freezed,
    Object? sleep = freezed,
    Object? stress = freezed,
    Object? diet = freezed,
    Object? energy = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: mood == freezed
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      sleep: sleep == freezed
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      stress: stress == freezed
          ? _value.stress
          : stress // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      diet: diet == freezed
          ? _value.diet
          : diet // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      energy: energy == freezed
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
    ));
  }
}

/// @nodoc
abstract class _$TrainingNotesModelCopyWith<$Res>
    implements $TrainingNotesModelCopyWith<$Res> {
  factory _$TrainingNotesModelCopyWith(
          _TrainingNotesModel value, $Res Function(_TrainingNotesModel) then) =
      __$TrainingNotesModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime dateTime,
      String? notes,
      Sentiment? mood,
      Sentiment? sleep,
      Sentiment? stress,
      Sentiment? diet,
      Sentiment? energy});
}

/// @nodoc
class __$TrainingNotesModelCopyWithImpl<$Res>
    extends _$TrainingNotesModelCopyWithImpl<$Res>
    implements _$TrainingNotesModelCopyWith<$Res> {
  __$TrainingNotesModelCopyWithImpl(
      _TrainingNotesModel _value, $Res Function(_TrainingNotesModel) _then)
      : super(_value, (v) => _then(v as _TrainingNotesModel));

  @override
  _TrainingNotesModel get _value => super._value as _TrainingNotesModel;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? notes = freezed,
    Object? mood = freezed,
    Object? sleep = freezed,
    Object? stress = freezed,
    Object? diet = freezed,
    Object? energy = freezed,
  }) {
    return _then(_TrainingNotesModel(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes == freezed
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      mood == freezed
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      sleep == freezed
          ? _value.sleep
          : sleep // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      stress == freezed
          ? _value.stress
          : stress // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      diet == freezed
          ? _value.diet
          : diet // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
      energy == freezed
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as Sentiment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrainingNotesModel extends _TrainingNotesModel {
  _$_TrainingNotesModel(this.dateTime, this.notes, this.mood, this.sleep,
      this.stress, this.diet, this.energy)
      : super._();

  factory _$_TrainingNotesModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrainingNotesModelFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final String? notes;
  @override
  final Sentiment? mood;
  @override
  final Sentiment? sleep;
  @override
  final Sentiment? stress;
  @override
  final Sentiment? diet;
  @override
  final Sentiment? energy;

  @override
  String toString() {
    return 'TrainingNotesModel(dateTime: $dateTime, notes: $notes, mood: $mood, sleep: $sleep, stress: $stress, diet: $diet, energy: $energy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TrainingNotesModel &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.notes, notes) &&
            const DeepCollectionEquality().equals(other.mood, mood) &&
            const DeepCollectionEquality().equals(other.sleep, sleep) &&
            const DeepCollectionEquality().equals(other.stress, stress) &&
            const DeepCollectionEquality().equals(other.diet, diet) &&
            const DeepCollectionEquality().equals(other.energy, energy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(notes),
      const DeepCollectionEquality().hash(mood),
      const DeepCollectionEquality().hash(sleep),
      const DeepCollectionEquality().hash(stress),
      const DeepCollectionEquality().hash(diet),
      const DeepCollectionEquality().hash(energy));

  @JsonKey(ignore: true)
  @override
  _$TrainingNotesModelCopyWith<_TrainingNotesModel> get copyWith =>
      __$TrainingNotesModelCopyWithImpl<_TrainingNotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrainingNotesModelToJson(this);
  }
}

abstract class _TrainingNotesModel extends TrainingNotesModel {
  factory _TrainingNotesModel(
      DateTime dateTime,
      String? notes,
      Sentiment? mood,
      Sentiment? sleep,
      Sentiment? stress,
      Sentiment? diet,
      Sentiment? energy) = _$_TrainingNotesModel;
  _TrainingNotesModel._() : super._();

  factory _TrainingNotesModel.fromJson(Map<String, dynamic> json) =
      _$_TrainingNotesModel.fromJson;

  @override
  DateTime get dateTime;
  @override
  String? get notes;
  @override
  Sentiment? get mood;
  @override
  Sentiment? get sleep;
  @override
  Sentiment? get stress;
  @override
  Sentiment? get diet;
  @override
  Sentiment? get energy;
  @override
  @JsonKey(ignore: true)
  _$TrainingNotesModelCopyWith<_TrainingNotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
