// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ObjectiveModel _$$_ObjectiveModelFromJson(Map<String, dynamic> json) =>
    _$_ObjectiveModel(
      json['targetCount'] as int? ?? 0,
      json['countCompleted'] as int? ?? 0,
      $enumDecodeNullable(_$ClimbTypeEnumMap, json['climbType']) ??
          ClimbType.boulder,
      $enumDecodeNullable(_$AscentTypeEnumMap, json['ascentType']) ??
          AscentType.redpoint,
      json['gradeLabel'] as String? ?? '?',
      json['exactGradesOnly'] as bool? ?? false,
      json['tag'] as String?,
    );

Map<String, dynamic> _$$_ObjectiveModelToJson(_$_ObjectiveModel instance) =>
    <String, dynamic>{
      'targetCount': instance.targetCount,
      'countCompleted': instance.countCompleted,
      'climbType': _$ClimbTypeEnumMap[instance.climbType],
      'ascentType': _$AscentTypeEnumMap[instance.ascentType],
      'gradeLabel': instance.gradeLabel,
      'exactGradesOnly': instance.exactGradesOnly,
      'tag': instance.tag,
    };

const _$ClimbTypeEnumMap = {
  ClimbType.boulder: 'boulder',
  ClimbType.sport: 'sport',
};

const _$AscentTypeEnumMap = {
  AscentType.redpoint: 'redpoint',
  AscentType.flash: 'flash',
  AscentType.onsight: 'onsight',
  AscentType.project: 'project',
};
