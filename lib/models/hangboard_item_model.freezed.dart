// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hangboard_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HangboardItemModel _$HangboardItemModelFromJson(Map<String, dynamic> json) {
  return _HangboardItemModel.fromJson(json);
}

/// @nodoc
class _$HangboardItemModelTearOff {
  const _$HangboardItemModelTearOff();

  _HangboardItemModel call(
      @JsonKey(defaultValue: "?") String name,
      String? modifier,
      String? holdSize,
      @JsonKey(defaultValue: 10) int seconds,
      @JsonKey(defaultValue: 0) int minutes,
      String uniqueId,
      @JsonKey(defaultValue: false) bool isRestBetweenSets) {
    return _HangboardItemModel(
      name,
      modifier,
      holdSize,
      seconds,
      minutes,
      uniqueId,
      isRestBetweenSets,
    );
  }

  HangboardItemModel fromJson(Map<String, Object?> json) {
    return HangboardItemModel.fromJson(json);
  }
}

/// @nodoc
const $HangboardItemModel = _$HangboardItemModelTearOff();

/// @nodoc
mixin _$HangboardItemModel {
  @JsonKey(defaultValue: "?")
  String get name => throw _privateConstructorUsedError;
  String? get modifier => throw _privateConstructorUsedError;
  String? get holdSize => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 10)
  int get seconds => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get minutes => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isRestBetweenSets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HangboardItemModelCopyWith<HangboardItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangboardItemModelCopyWith<$Res> {
  factory $HangboardItemModelCopyWith(
          HangboardItemModel value, $Res Function(HangboardItemModel) then) =
      _$HangboardItemModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: "?") String name,
      String? modifier,
      String? holdSize,
      @JsonKey(defaultValue: 10) int seconds,
      @JsonKey(defaultValue: 0) int minutes,
      String uniqueId,
      @JsonKey(defaultValue: false) bool isRestBetweenSets});
}

/// @nodoc
class _$HangboardItemModelCopyWithImpl<$Res>
    implements $HangboardItemModelCopyWith<$Res> {
  _$HangboardItemModelCopyWithImpl(this._value, this._then);

  final HangboardItemModel _value;
  // ignore: unused_field
  final $Res Function(HangboardItemModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? modifier = freezed,
    Object? holdSize = freezed,
    Object? seconds = freezed,
    Object? minutes = freezed,
    Object? uniqueId = freezed,
    Object? isRestBetweenSets = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modifier: modifier == freezed
          ? _value.modifier
          : modifier // ignore: cast_nullable_to_non_nullable
              as String?,
      holdSize: holdSize == freezed
          ? _value.holdSize
          : holdSize // ignore: cast_nullable_to_non_nullable
              as String?,
      seconds: seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      isRestBetweenSets: isRestBetweenSets == freezed
          ? _value.isRestBetweenSets
          : isRestBetweenSets // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$HangboardItemModelCopyWith<$Res>
    implements $HangboardItemModelCopyWith<$Res> {
  factory _$HangboardItemModelCopyWith(
          _HangboardItemModel value, $Res Function(_HangboardItemModel) then) =
      __$HangboardItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: "?") String name,
      String? modifier,
      String? holdSize,
      @JsonKey(defaultValue: 10) int seconds,
      @JsonKey(defaultValue: 0) int minutes,
      String uniqueId,
      @JsonKey(defaultValue: false) bool isRestBetweenSets});
}

/// @nodoc
class __$HangboardItemModelCopyWithImpl<$Res>
    extends _$HangboardItemModelCopyWithImpl<$Res>
    implements _$HangboardItemModelCopyWith<$Res> {
  __$HangboardItemModelCopyWithImpl(
      _HangboardItemModel _value, $Res Function(_HangboardItemModel) _then)
      : super(_value, (v) => _then(v as _HangboardItemModel));

  @override
  _HangboardItemModel get _value => super._value as _HangboardItemModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? modifier = freezed,
    Object? holdSize = freezed,
    Object? seconds = freezed,
    Object? minutes = freezed,
    Object? uniqueId = freezed,
    Object? isRestBetweenSets = freezed,
  }) {
    return _then(_HangboardItemModel(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modifier == freezed
          ? _value.modifier
          : modifier // ignore: cast_nullable_to_non_nullable
              as String?,
      holdSize == freezed
          ? _value.holdSize
          : holdSize // ignore: cast_nullable_to_non_nullable
              as String?,
      seconds == freezed
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      isRestBetweenSets == freezed
          ? _value.isRestBetweenSets
          : isRestBetweenSets // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HangboardItemModel extends _HangboardItemModel {
  _$_HangboardItemModel(
      @JsonKey(defaultValue: "?") this.name,
      this.modifier,
      this.holdSize,
      @JsonKey(defaultValue: 10) this.seconds,
      @JsonKey(defaultValue: 0) this.minutes,
      this.uniqueId,
      @JsonKey(defaultValue: false) this.isRestBetweenSets)
      : super._();

  factory _$_HangboardItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_HangboardItemModelFromJson(json);

  @override
  @JsonKey(defaultValue: "?")
  final String name;
  @override
  final String? modifier;
  @override
  final String? holdSize;
  @override
  @JsonKey(defaultValue: 10)
  final int seconds;
  @override
  @JsonKey(defaultValue: 0)
  final int minutes;
  @override
  final String uniqueId;
  @override
  @JsonKey(defaultValue: false)
  final bool isRestBetweenSets;

  @override
  String toString() {
    return 'HangboardItemModel(name: $name, modifier: $modifier, holdSize: $holdSize, seconds: $seconds, minutes: $minutes, uniqueId: $uniqueId, isRestBetweenSets: $isRestBetweenSets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HangboardItemModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.modifier, modifier) &&
            const DeepCollectionEquality().equals(other.holdSize, holdSize) &&
            const DeepCollectionEquality().equals(other.seconds, seconds) &&
            const DeepCollectionEquality().equals(other.minutes, minutes) &&
            const DeepCollectionEquality().equals(other.uniqueId, uniqueId) &&
            const DeepCollectionEquality()
                .equals(other.isRestBetweenSets, isRestBetweenSets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(modifier),
      const DeepCollectionEquality().hash(holdSize),
      const DeepCollectionEquality().hash(seconds),
      const DeepCollectionEquality().hash(minutes),
      const DeepCollectionEquality().hash(uniqueId),
      const DeepCollectionEquality().hash(isRestBetweenSets));

  @JsonKey(ignore: true)
  @override
  _$HangboardItemModelCopyWith<_HangboardItemModel> get copyWith =>
      __$HangboardItemModelCopyWithImpl<_HangboardItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HangboardItemModelToJson(this);
  }
}

abstract class _HangboardItemModel extends HangboardItemModel {
  factory _HangboardItemModel(
          @JsonKey(defaultValue: "?") String name,
          String? modifier,
          String? holdSize,
          @JsonKey(defaultValue: 10) int seconds,
          @JsonKey(defaultValue: 0) int minutes,
          String uniqueId,
          @JsonKey(defaultValue: false) bool isRestBetweenSets) =
      _$_HangboardItemModel;
  _HangboardItemModel._() : super._();

  factory _HangboardItemModel.fromJson(Map<String, dynamic> json) =
      _$_HangboardItemModel.fromJson;

  @override
  @JsonKey(defaultValue: "?")
  String get name;
  @override
  String? get modifier;
  @override
  String? get holdSize;
  @override
  @JsonKey(defaultValue: 10)
  int get seconds;
  @override
  @JsonKey(defaultValue: 0)
  int get minutes;
  @override
  String get uniqueId;
  @override
  @JsonKey(defaultValue: false)
  bool get isRestBetweenSets;
  @override
  @JsonKey(ignore: true)
  _$HangboardItemModelCopyWith<_HangboardItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
