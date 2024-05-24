// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangboard_routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HangboardRoutineModel _$$_HangboardRoutineModelFromJson(
        Map<String, dynamic> json) =>
    _$_HangboardRoutineModel(
      json['name'] as String,
      const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      json['score'] as int? ?? 100,
      json['sets'] as int? ?? 1,
      json['restBetweenSetsMinutes'] as int? ?? 1,
      json['restBetweenSetsSeconds'] as int? ?? 0,
      HangboardRoutineModel.setDefinitionFromJson(json['items'] as List),
    );

Map<String, dynamic> _$$_HangboardRoutineModelToJson(
        _$_HangboardRoutineModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'score': instance.score,
      'sets': instance.sets,
      'restBetweenSetsMinutes': instance.restBetweenSetsMinutes,
      'restBetweenSetsSeconds': instance.restBetweenSetsSeconds,
      'items': HangboardRoutineModel.setDefinitionToJson(instance.items),
    };
