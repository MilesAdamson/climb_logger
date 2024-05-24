// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
class _$SettingsModelTearOff {
  const _$SettingsModelTearOff();

  _SettingsModel call(
      @JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      @JsonKey(defaultValue: "vermin")
          String boulderingSystemKey,
      @JsonKey(defaultValue: "yosemite")
          String sportSystemKey,
      @JsonKey(defaultValue: false)
          bool exactGradesOnly,
      @JsonKey(defaultValue: true)
          bool playTimerSounds,
      @JsonKey(defaultValue: SettingsModel.defaultTags)
          List<String> tags,
      @JsonKey(name: "colorOne")
          int? colorOneValue,
      @JsonKey(name: "colorTwo")
          int? colorTwoValue,
      @JsonKey(name: "colorThree")
          int? colorThreeValue,
      @JsonKey(name: "colorFour")
          int? colorFourValue,
      @JsonKey(name: "colorFive")
          int? colorFiveValue,
      @JsonKey(name: "colorSix")
          int? colorSixValue,
      @JsonKey(defaultValue: ChartYAxisType.bouldering)
          ChartYAxisType chartYAxisType,
      @JsonKey(defaultValue: MeasurementSystem.metric)
          MeasurementSystem measurementSystem) {
    return _SettingsModel(
      ascentType,
      climbType,
      wallType,
      boulderingSystemKey,
      sportSystemKey,
      exactGradesOnly,
      playTimerSounds,
      tags,
      colorOneValue,
      colorTwoValue,
      colorThreeValue,
      colorFourValue,
      colorFiveValue,
      colorSixValue,
      chartYAxisType,
      measurementSystem,
    );
  }

  SettingsModel fromJson(Map<String, Object?> json) {
    return SettingsModel.fromJson(json);
  }
}

/// @nodoc
const $SettingsModel = _$SettingsModelTearOff();

/// @nodoc
mixin _$SettingsModel {
  @JsonKey(defaultValue: AscentType.redpoint)
  AscentType get ascentType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: WallType.overhang)
  WallType get wallType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "vermin")
  String get boulderingSystemKey => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "yosemite")
  String get sportSystemKey => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get exactGradesOnly => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: true)
  bool get playTimerSounds => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: SettingsModel.defaultTags)
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: "colorOne")
  int? get colorOneValue => throw _privateConstructorUsedError;
  @JsonKey(name: "colorTwo")
  int? get colorTwoValue => throw _privateConstructorUsedError;
  @JsonKey(name: "colorThree")
  int? get colorThreeValue => throw _privateConstructorUsedError;
  @JsonKey(name: "colorFour")
  int? get colorFourValue => throw _privateConstructorUsedError;
  @JsonKey(name: "colorFive")
  int? get colorFiveValue => throw _privateConstructorUsedError;
  @JsonKey(name: "colorSix")
  int? get colorSixValue => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ChartYAxisType.bouldering)
  ChartYAxisType get chartYAxisType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: MeasurementSystem.metric)
  MeasurementSystem get measurementSystem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      @JsonKey(defaultValue: "vermin")
          String boulderingSystemKey,
      @JsonKey(defaultValue: "yosemite")
          String sportSystemKey,
      @JsonKey(defaultValue: false)
          bool exactGradesOnly,
      @JsonKey(defaultValue: true)
          bool playTimerSounds,
      @JsonKey(defaultValue: SettingsModel.defaultTags)
          List<String> tags,
      @JsonKey(name: "colorOne")
          int? colorOneValue,
      @JsonKey(name: "colorTwo")
          int? colorTwoValue,
      @JsonKey(name: "colorThree")
          int? colorThreeValue,
      @JsonKey(name: "colorFour")
          int? colorFourValue,
      @JsonKey(name: "colorFive")
          int? colorFiveValue,
      @JsonKey(name: "colorSix")
          int? colorSixValue,
      @JsonKey(defaultValue: ChartYAxisType.bouldering)
          ChartYAxisType chartYAxisType,
      @JsonKey(defaultValue: MeasurementSystem.metric)
          MeasurementSystem measurementSystem});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  final SettingsModel _value;
  // ignore: unused_field
  final $Res Function(SettingsModel) _then;

  @override
  $Res call({
    Object? ascentType = freezed,
    Object? climbType = freezed,
    Object? wallType = freezed,
    Object? boulderingSystemKey = freezed,
    Object? sportSystemKey = freezed,
    Object? exactGradesOnly = freezed,
    Object? playTimerSounds = freezed,
    Object? tags = freezed,
    Object? colorOneValue = freezed,
    Object? colorTwoValue = freezed,
    Object? colorThreeValue = freezed,
    Object? colorFourValue = freezed,
    Object? colorFiveValue = freezed,
    Object? colorSixValue = freezed,
    Object? chartYAxisType = freezed,
    Object? measurementSystem = freezed,
  }) {
    return _then(_value.copyWith(
      ascentType: ascentType == freezed
          ? _value.ascentType
          : ascentType // ignore: cast_nullable_to_non_nullable
              as AscentType,
      climbType: climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      wallType: wallType == freezed
          ? _value.wallType
          : wallType // ignore: cast_nullable_to_non_nullable
              as WallType,
      boulderingSystemKey: boulderingSystemKey == freezed
          ? _value.boulderingSystemKey
          : boulderingSystemKey // ignore: cast_nullable_to_non_nullable
              as String,
      sportSystemKey: sportSystemKey == freezed
          ? _value.sportSystemKey
          : sportSystemKey // ignore: cast_nullable_to_non_nullable
              as String,
      exactGradesOnly: exactGradesOnly == freezed
          ? _value.exactGradesOnly
          : exactGradesOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      playTimerSounds: playTimerSounds == freezed
          ? _value.playTimerSounds
          : playTimerSounds // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      colorOneValue: colorOneValue == freezed
          ? _value.colorOneValue
          : colorOneValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorTwoValue: colorTwoValue == freezed
          ? _value.colorTwoValue
          : colorTwoValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorThreeValue: colorThreeValue == freezed
          ? _value.colorThreeValue
          : colorThreeValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorFourValue: colorFourValue == freezed
          ? _value.colorFourValue
          : colorFourValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorFiveValue: colorFiveValue == freezed
          ? _value.colorFiveValue
          : colorFiveValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorSixValue: colorSixValue == freezed
          ? _value.colorSixValue
          : colorSixValue // ignore: cast_nullable_to_non_nullable
              as int?,
      chartYAxisType: chartYAxisType == freezed
          ? _value.chartYAxisType
          : chartYAxisType // ignore: cast_nullable_to_non_nullable
              as ChartYAxisType,
      measurementSystem: measurementSystem == freezed
          ? _value.measurementSystem
          : measurementSystem // ignore: cast_nullable_to_non_nullable
              as MeasurementSystem,
    ));
  }
}

/// @nodoc
abstract class _$SettingsModelCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$SettingsModelCopyWith(
          _SettingsModel value, $Res Function(_SettingsModel) then) =
      __$SettingsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      @JsonKey(defaultValue: "vermin")
          String boulderingSystemKey,
      @JsonKey(defaultValue: "yosemite")
          String sportSystemKey,
      @JsonKey(defaultValue: false)
          bool exactGradesOnly,
      @JsonKey(defaultValue: true)
          bool playTimerSounds,
      @JsonKey(defaultValue: SettingsModel.defaultTags)
          List<String> tags,
      @JsonKey(name: "colorOne")
          int? colorOneValue,
      @JsonKey(name: "colorTwo")
          int? colorTwoValue,
      @JsonKey(name: "colorThree")
          int? colorThreeValue,
      @JsonKey(name: "colorFour")
          int? colorFourValue,
      @JsonKey(name: "colorFive")
          int? colorFiveValue,
      @JsonKey(name: "colorSix")
          int? colorSixValue,
      @JsonKey(defaultValue: ChartYAxisType.bouldering)
          ChartYAxisType chartYAxisType,
      @JsonKey(defaultValue: MeasurementSystem.metric)
          MeasurementSystem measurementSystem});
}

/// @nodoc
class __$SettingsModelCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res>
    implements _$SettingsModelCopyWith<$Res> {
  __$SettingsModelCopyWithImpl(
      _SettingsModel _value, $Res Function(_SettingsModel) _then)
      : super(_value, (v) => _then(v as _SettingsModel));

  @override
  _SettingsModel get _value => super._value as _SettingsModel;

  @override
  $Res call({
    Object? ascentType = freezed,
    Object? climbType = freezed,
    Object? wallType = freezed,
    Object? boulderingSystemKey = freezed,
    Object? sportSystemKey = freezed,
    Object? exactGradesOnly = freezed,
    Object? playTimerSounds = freezed,
    Object? tags = freezed,
    Object? colorOneValue = freezed,
    Object? colorTwoValue = freezed,
    Object? colorThreeValue = freezed,
    Object? colorFourValue = freezed,
    Object? colorFiveValue = freezed,
    Object? colorSixValue = freezed,
    Object? chartYAxisType = freezed,
    Object? measurementSystem = freezed,
  }) {
    return _then(_SettingsModel(
      ascentType == freezed
          ? _value.ascentType
          : ascentType // ignore: cast_nullable_to_non_nullable
              as AscentType,
      climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      wallType == freezed
          ? _value.wallType
          : wallType // ignore: cast_nullable_to_non_nullable
              as WallType,
      boulderingSystemKey == freezed
          ? _value.boulderingSystemKey
          : boulderingSystemKey // ignore: cast_nullable_to_non_nullable
              as String,
      sportSystemKey == freezed
          ? _value.sportSystemKey
          : sportSystemKey // ignore: cast_nullable_to_non_nullable
              as String,
      exactGradesOnly == freezed
          ? _value.exactGradesOnly
          : exactGradesOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      playTimerSounds == freezed
          ? _value.playTimerSounds
          : playTimerSounds // ignore: cast_nullable_to_non_nullable
              as bool,
      tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      colorOneValue == freezed
          ? _value.colorOneValue
          : colorOneValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorTwoValue == freezed
          ? _value.colorTwoValue
          : colorTwoValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorThreeValue == freezed
          ? _value.colorThreeValue
          : colorThreeValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorFourValue == freezed
          ? _value.colorFourValue
          : colorFourValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorFiveValue == freezed
          ? _value.colorFiveValue
          : colorFiveValue // ignore: cast_nullable_to_non_nullable
              as int?,
      colorSixValue == freezed
          ? _value.colorSixValue
          : colorSixValue // ignore: cast_nullable_to_non_nullable
              as int?,
      chartYAxisType == freezed
          ? _value.chartYAxisType
          : chartYAxisType // ignore: cast_nullable_to_non_nullable
              as ChartYAxisType,
      measurementSystem == freezed
          ? _value.measurementSystem
          : measurementSystem // ignore: cast_nullable_to_non_nullable
              as MeasurementSystem,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SettingsModel extends _SettingsModel {
  _$_SettingsModel(
      @JsonKey(defaultValue: AscentType.redpoint) this.ascentType,
      @JsonKey(defaultValue: ClimbType.boulder) this.climbType,
      @JsonKey(defaultValue: WallType.overhang) this.wallType,
      @JsonKey(defaultValue: "vermin") this.boulderingSystemKey,
      @JsonKey(defaultValue: "yosemite") this.sportSystemKey,
      @JsonKey(defaultValue: false) this.exactGradesOnly,
      @JsonKey(defaultValue: true) this.playTimerSounds,
      @JsonKey(defaultValue: SettingsModel.defaultTags) this.tags,
      @JsonKey(name: "colorOne") this.colorOneValue,
      @JsonKey(name: "colorTwo") this.colorTwoValue,
      @JsonKey(name: "colorThree") this.colorThreeValue,
      @JsonKey(name: "colorFour") this.colorFourValue,
      @JsonKey(name: "colorFive") this.colorFiveValue,
      @JsonKey(name: "colorSix") this.colorSixValue,
      @JsonKey(defaultValue: ChartYAxisType.bouldering) this.chartYAxisType,
      @JsonKey(defaultValue: MeasurementSystem.metric) this.measurementSystem)
      : super._();

  factory _$_SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsModelFromJson(json);

  @override
  @JsonKey(defaultValue: AscentType.redpoint)
  final AscentType ascentType;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  final ClimbType climbType;
  @override
  @JsonKey(defaultValue: WallType.overhang)
  final WallType wallType;
  @override
  @JsonKey(defaultValue: "vermin")
  final String boulderingSystemKey;
  @override
  @JsonKey(defaultValue: "yosemite")
  final String sportSystemKey;
  @override
  @JsonKey(defaultValue: false)
  final bool exactGradesOnly;
  @override
  @JsonKey(defaultValue: true)
  final bool playTimerSounds;
  @override
  @JsonKey(defaultValue: SettingsModel.defaultTags)
  final List<String> tags;
  @override
  @JsonKey(name: "colorOne")
  final int? colorOneValue;
  @override
  @JsonKey(name: "colorTwo")
  final int? colorTwoValue;
  @override
  @JsonKey(name: "colorThree")
  final int? colorThreeValue;
  @override
  @JsonKey(name: "colorFour")
  final int? colorFourValue;
  @override
  @JsonKey(name: "colorFive")
  final int? colorFiveValue;
  @override
  @JsonKey(name: "colorSix")
  final int? colorSixValue;
  @override
  @JsonKey(defaultValue: ChartYAxisType.bouldering)
  final ChartYAxisType chartYAxisType;
  @override
  @JsonKey(defaultValue: MeasurementSystem.metric)
  final MeasurementSystem measurementSystem;

  @override
  String toString() {
    return 'SettingsModel(ascentType: $ascentType, climbType: $climbType, wallType: $wallType, boulderingSystemKey: $boulderingSystemKey, sportSystemKey: $sportSystemKey, exactGradesOnly: $exactGradesOnly, playTimerSounds: $playTimerSounds, tags: $tags, colorOneValue: $colorOneValue, colorTwoValue: $colorTwoValue, colorThreeValue: $colorThreeValue, colorFourValue: $colorFourValue, colorFiveValue: $colorFiveValue, colorSixValue: $colorSixValue, chartYAxisType: $chartYAxisType, measurementSystem: $measurementSystem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsModel &&
            const DeepCollectionEquality()
                .equals(other.ascentType, ascentType) &&
            const DeepCollectionEquality().equals(other.climbType, climbType) &&
            const DeepCollectionEquality().equals(other.wallType, wallType) &&
            const DeepCollectionEquality()
                .equals(other.boulderingSystemKey, boulderingSystemKey) &&
            const DeepCollectionEquality()
                .equals(other.sportSystemKey, sportSystemKey) &&
            const DeepCollectionEquality()
                .equals(other.exactGradesOnly, exactGradesOnly) &&
            const DeepCollectionEquality()
                .equals(other.playTimerSounds, playTimerSounds) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.colorOneValue, colorOneValue) &&
            const DeepCollectionEquality()
                .equals(other.colorTwoValue, colorTwoValue) &&
            const DeepCollectionEquality()
                .equals(other.colorThreeValue, colorThreeValue) &&
            const DeepCollectionEquality()
                .equals(other.colorFourValue, colorFourValue) &&
            const DeepCollectionEquality()
                .equals(other.colorFiveValue, colorFiveValue) &&
            const DeepCollectionEquality()
                .equals(other.colorSixValue, colorSixValue) &&
            const DeepCollectionEquality()
                .equals(other.chartYAxisType, chartYAxisType) &&
            const DeepCollectionEquality()
                .equals(other.measurementSystem, measurementSystem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ascentType),
      const DeepCollectionEquality().hash(climbType),
      const DeepCollectionEquality().hash(wallType),
      const DeepCollectionEquality().hash(boulderingSystemKey),
      const DeepCollectionEquality().hash(sportSystemKey),
      const DeepCollectionEquality().hash(exactGradesOnly),
      const DeepCollectionEquality().hash(playTimerSounds),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(colorOneValue),
      const DeepCollectionEquality().hash(colorTwoValue),
      const DeepCollectionEquality().hash(colorThreeValue),
      const DeepCollectionEquality().hash(colorFourValue),
      const DeepCollectionEquality().hash(colorFiveValue),
      const DeepCollectionEquality().hash(colorSixValue),
      const DeepCollectionEquality().hash(chartYAxisType),
      const DeepCollectionEquality().hash(measurementSystem));

  @JsonKey(ignore: true)
  @override
  _$SettingsModelCopyWith<_SettingsModel> get copyWith =>
      __$SettingsModelCopyWithImpl<_SettingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsModelToJson(this);
  }
}

abstract class _SettingsModel extends SettingsModel {
  factory _SettingsModel(
      @JsonKey(defaultValue: AscentType.redpoint)
          AscentType ascentType,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      @JsonKey(defaultValue: "vermin")
          String boulderingSystemKey,
      @JsonKey(defaultValue: "yosemite")
          String sportSystemKey,
      @JsonKey(defaultValue: false)
          bool exactGradesOnly,
      @JsonKey(defaultValue: true)
          bool playTimerSounds,
      @JsonKey(defaultValue: SettingsModel.defaultTags)
          List<String> tags,
      @JsonKey(name: "colorOne")
          int? colorOneValue,
      @JsonKey(name: "colorTwo")
          int? colorTwoValue,
      @JsonKey(name: "colorThree")
          int? colorThreeValue,
      @JsonKey(name: "colorFour")
          int? colorFourValue,
      @JsonKey(name: "colorFive")
          int? colorFiveValue,
      @JsonKey(name: "colorSix")
          int? colorSixValue,
      @JsonKey(defaultValue: ChartYAxisType.bouldering)
          ChartYAxisType chartYAxisType,
      @JsonKey(defaultValue: MeasurementSystem.metric)
          MeasurementSystem measurementSystem) = _$_SettingsModel;
  _SettingsModel._() : super._();

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$_SettingsModel.fromJson;

  @override
  @JsonKey(defaultValue: AscentType.redpoint)
  AscentType get ascentType;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType;
  @override
  @JsonKey(defaultValue: WallType.overhang)
  WallType get wallType;
  @override
  @JsonKey(defaultValue: "vermin")
  String get boulderingSystemKey;
  @override
  @JsonKey(defaultValue: "yosemite")
  String get sportSystemKey;
  @override
  @JsonKey(defaultValue: false)
  bool get exactGradesOnly;
  @override
  @JsonKey(defaultValue: true)
  bool get playTimerSounds;
  @override
  @JsonKey(defaultValue: SettingsModel.defaultTags)
  List<String> get tags;
  @override
  @JsonKey(name: "colorOne")
  int? get colorOneValue;
  @override
  @JsonKey(name: "colorTwo")
  int? get colorTwoValue;
  @override
  @JsonKey(name: "colorThree")
  int? get colorThreeValue;
  @override
  @JsonKey(name: "colorFour")
  int? get colorFourValue;
  @override
  @JsonKey(name: "colorFive")
  int? get colorFiveValue;
  @override
  @JsonKey(name: "colorSix")
  int? get colorSixValue;
  @override
  @JsonKey(defaultValue: ChartYAxisType.bouldering)
  ChartYAxisType get chartYAxisType;
  @override
  @JsonKey(defaultValue: MeasurementSystem.metric)
  MeasurementSystem get measurementSystem;
  @override
  @JsonKey(ignore: true)
  _$SettingsModelCopyWith<_SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
