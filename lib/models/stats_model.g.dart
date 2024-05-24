// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatsModel _$$_StatsModelFromJson(Map<String, dynamic> json) =>
    _$_StatsModel(
      json['logbookCount'] as int? ?? 0,
      json['projectCount'] as int? ?? 0,
      json['goalCount'] as int? ?? 0,
      json['userCount'] as int? ?? 0,
      json['hangboardEntryCount'] as int? ?? 0,
      json['hangboardRoutineCount'] as int? ?? 0,
      json['trainingNotesCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StatsModelToJson(_$_StatsModel instance) =>
    <String, dynamic>{
      'logbookCount': instance.logbookCount,
      'projectCount': instance.projectCount,
      'goalCount': instance.goalCount,
      'userCount': instance.userCount,
      'hangboardEntryCount': instance.hangboardEntryCount,
      'hangboardRoutineCount': instance.hangboardRoutineCount,
      'trainingNotesCount': instance.trainingNotesCount,
    };
