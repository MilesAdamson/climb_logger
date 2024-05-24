// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logbook_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LogbookEntryModel _$$_LogbookEntryModelFromJson(Map<String, dynamic> json) =>
    _$_LogbookEntryModel(
      const TimestampConverter().fromJson(json['timestamp'] as Timestamp?),
      json['details'] as String?,
      json['climbName'] as String?,
      json['gradeLabel'] as String? ?? '?',
      $enumDecodeNullable(_$ClimbTypeEnumMap, json['climbType']) ??
          ClimbType.boulder,
      $enumDecodeNullable(_$AscentTypeEnumMap, json['ascentType']) ??
          AscentType.redpoint,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      $enumDecodeNullable(_$WallTypeEnumMap, json['wallType']) ??
          WallType.overhang,
      json['attempts'] as int?,
    );

Map<String, dynamic> _$$_LogbookEntryModelToJson(
        _$_LogbookEntryModel instance) =>
    <String, dynamic>{
      'timestamp': const TimestampConverter().toJson(instance.dateTime),
      'details': instance.details,
      'climbName': instance.climbName,
      'gradeLabel': instance.gradeLabel,
      'climbType': _$ClimbTypeEnumMap[instance.climbType],
      'ascentType': _$AscentTypeEnumMap[instance.ascentType],
      'tags': instance.tags,
      'wallType': _$WallTypeEnumMap[instance.wallType],
      'attempts': instance.attempts,
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

const _$WallTypeEnumMap = {
  WallType.slab: 'slab',
  WallType.vert: 'vert',
  WallType.overhang: 'overhang',
  WallType.roof: 'roof',
};
