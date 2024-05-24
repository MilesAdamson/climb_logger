// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      json['gradeLabel'] as String? ?? 'V1',
      json['name'] as String? ?? 'Project Name',
      $enumDecodeNullable(_$ClimbTypeEnumMap, json['climbType']) ??
          ClimbType.boulder,
      $enumDecodeNullable(_$WallTypeEnumMap, json['wallType']) ??
          WallType.overhang,
      const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      (json['relatedLogbookEntryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      (json['beta'] as List<dynamic>?)
              ?.map((e) => BetaModel.fromJson(e))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'gradeLabel': instance.gradeLabel,
      'name': instance.name,
      'climbType': _$ClimbTypeEnumMap[instance.climbType],
      'wallType': _$WallTypeEnumMap[instance.wallType],
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'relatedLogbookEntryIds': instance.relatedLogbookEntryIds,
      'tags': instance.tags,
      'beta': instance.beta.map((e) => e.toJson()).toList(),
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
