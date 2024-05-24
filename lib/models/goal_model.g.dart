// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoalModel _$$_GoalModelFromJson(Map<String, dynamic> json) => _$_GoalModel(
      (json['objectives'] as List<dynamic>)
          .map((e) => ObjectiveModel.fromJson(e))
          .toList(),
      const TimestampConverter().fromJson(json['endDateGoal'] as Timestamp?),
      const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_GoalModelToJson(_$_GoalModel instance) =>
    <String, dynamic>{
      'objectives': instance.objectives.map((e) => e.toJson()).toList(),
      'endDateGoal': const TimestampConverter().toJson(instance.endDateGoal),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
