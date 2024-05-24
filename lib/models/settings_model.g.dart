// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsModel _$$_SettingsModelFromJson(Map<String, dynamic> json) =>
    _$_SettingsModel(
      $enumDecodeNullable(_$AscentTypeEnumMap, json['ascentType']) ??
          AscentType.redpoint,
      $enumDecodeNullable(_$ClimbTypeEnumMap, json['climbType']) ??
          ClimbType.boulder,
      $enumDecodeNullable(_$WallTypeEnumMap, json['wallType']) ??
          WallType.overhang,
      json['boulderingSystemKey'] as String? ?? 'vermin',
      json['sportSystemKey'] as String? ?? 'yosemite',
      json['exactGradesOnly'] as bool? ?? false,
      json['playTimerSounds'] as bool? ?? true,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [
            'Crimps',
            'Slopers',
            'Edges',
            'Jugs',
            'Pinches',
            'Dynamic',
            'Static',
            'Dyno',
            'Volumes',
            'Reachy',
            'Scrunchy',
            'Technical',
            'Outdoors'
          ],
      json['colorOne'] as int?,
      json['colorTwo'] as int?,
      json['colorThree'] as int?,
      json['colorFour'] as int?,
      json['colorFive'] as int?,
      json['colorSix'] as int?,
      $enumDecodeNullable(_$ChartYAxisTypeEnumMap, json['chartYAxisType']) ??
          ChartYAxisType.bouldering,
      $enumDecodeNullable(
              _$MeasurementSystemEnumMap, json['measurementSystem']) ??
          MeasurementSystem.metric,
    );

Map<String, dynamic> _$$_SettingsModelToJson(_$_SettingsModel instance) =>
    <String, dynamic>{
      'ascentType': _$AscentTypeEnumMap[instance.ascentType],
      'climbType': _$ClimbTypeEnumMap[instance.climbType],
      'wallType': _$WallTypeEnumMap[instance.wallType],
      'boulderingSystemKey': instance.boulderingSystemKey,
      'sportSystemKey': instance.sportSystemKey,
      'exactGradesOnly': instance.exactGradesOnly,
      'playTimerSounds': instance.playTimerSounds,
      'tags': instance.tags,
      'colorOne': instance.colorOneValue,
      'colorTwo': instance.colorTwoValue,
      'colorThree': instance.colorThreeValue,
      'colorFour': instance.colorFourValue,
      'colorFive': instance.colorFiveValue,
      'colorSix': instance.colorSixValue,
      'chartYAxisType': _$ChartYAxisTypeEnumMap[instance.chartYAxisType],
      'measurementSystem':
          _$MeasurementSystemEnumMap[instance.measurementSystem],
    };

const _$AscentTypeEnumMap = {
  AscentType.redpoint: 'redpoint',
  AscentType.flash: 'flash',
  AscentType.onsight: 'onsight',
  AscentType.project: 'project',
};

const _$ClimbTypeEnumMap = {
  ClimbType.boulder: 'boulder',
  ClimbType.sport: 'sport',
};

const _$WallTypeEnumMap = {
  WallType.slab: 'slab',
  WallType.vert: 'vert',
  WallType.overhang: 'overhang',
  WallType.roof: 'roof',
};

const _$ChartYAxisTypeEnumMap = {
  ChartYAxisType.bouldering: 'bouldering',
  ChartYAxisType.sport: 'sport',
  ChartYAxisType.score: 'score',
};

const _$MeasurementSystemEnumMap = {
  MeasurementSystem.metric: 'metric',
  MeasurementSystem.imperial: 'imperial',
};
