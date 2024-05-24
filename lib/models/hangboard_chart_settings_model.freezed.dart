// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'hangboard_chart_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HangboardChartSettingsModelTearOff {
  const _$HangboardChartSettingsModelTearOff();

  _HangboardChartSettingsModel call(List<String> holdSizes) {
    return _HangboardChartSettingsModel(
      holdSizes,
    );
  }
}

/// @nodoc
const $HangboardChartSettingsModel = _$HangboardChartSettingsModelTearOff();

/// @nodoc
mixin _$HangboardChartSettingsModel {
  List<String> get holdSizes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HangboardChartSettingsModelCopyWith<HangboardChartSettingsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HangboardChartSettingsModelCopyWith<$Res> {
  factory $HangboardChartSettingsModelCopyWith(
          HangboardChartSettingsModel value,
          $Res Function(HangboardChartSettingsModel) then) =
      _$HangboardChartSettingsModelCopyWithImpl<$Res>;
  $Res call({List<String> holdSizes});
}

/// @nodoc
class _$HangboardChartSettingsModelCopyWithImpl<$Res>
    implements $HangboardChartSettingsModelCopyWith<$Res> {
  _$HangboardChartSettingsModelCopyWithImpl(this._value, this._then);

  final HangboardChartSettingsModel _value;
  // ignore: unused_field
  final $Res Function(HangboardChartSettingsModel) _then;

  @override
  $Res call({
    Object? holdSizes = freezed,
  }) {
    return _then(_value.copyWith(
      holdSizes: holdSizes == freezed
          ? _value.holdSizes
          : holdSizes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$HangboardChartSettingsModelCopyWith<$Res>
    implements $HangboardChartSettingsModelCopyWith<$Res> {
  factory _$HangboardChartSettingsModelCopyWith(
          _HangboardChartSettingsModel value,
          $Res Function(_HangboardChartSettingsModel) then) =
      __$HangboardChartSettingsModelCopyWithImpl<$Res>;
  @override
  $Res call({List<String> holdSizes});
}

/// @nodoc
class __$HangboardChartSettingsModelCopyWithImpl<$Res>
    extends _$HangboardChartSettingsModelCopyWithImpl<$Res>
    implements _$HangboardChartSettingsModelCopyWith<$Res> {
  __$HangboardChartSettingsModelCopyWithImpl(
      _HangboardChartSettingsModel _value,
      $Res Function(_HangboardChartSettingsModel) _then)
      : super(_value, (v) => _then(v as _HangboardChartSettingsModel));

  @override
  _HangboardChartSettingsModel get _value =>
      super._value as _HangboardChartSettingsModel;

  @override
  $Res call({
    Object? holdSizes = freezed,
  }) {
    return _then(_HangboardChartSettingsModel(
      holdSizes == freezed
          ? _value.holdSizes
          : holdSizes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_HangboardChartSettingsModel extends _HangboardChartSettingsModel {
  _$_HangboardChartSettingsModel(this.holdSizes) : super._();

  @override
  final List<String> holdSizes;

  @override
  String toString() {
    return 'HangboardChartSettingsModel(holdSizes: $holdSizes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HangboardChartSettingsModel &&
            const DeepCollectionEquality().equals(other.holdSizes, holdSizes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(holdSizes));

  @JsonKey(ignore: true)
  @override
  _$HangboardChartSettingsModelCopyWith<_HangboardChartSettingsModel>
      get copyWith => __$HangboardChartSettingsModelCopyWithImpl<
          _HangboardChartSettingsModel>(this, _$identity);
}

abstract class _HangboardChartSettingsModel
    extends HangboardChartSettingsModel {
  factory _HangboardChartSettingsModel(List<String> holdSizes) =
      _$_HangboardChartSettingsModel;
  _HangboardChartSettingsModel._() : super._();

  @override
  List<String> get holdSizes;
  @override
  @JsonKey(ignore: true)
  _$HangboardChartSettingsModelCopyWith<_HangboardChartSettingsModel>
      get copyWith => throw _privateConstructorUsedError;
}
