// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainingNotesModel _$$_TrainingNotesModelFromJson(
        Map<String, dynamic> json) =>
    _$_TrainingNotesModel(
      DateTime.parse(json['dateTime'] as String),
      json['notes'] as String?,
      $enumDecodeNullable(_$SentimentEnumMap, json['mood']),
      $enumDecodeNullable(_$SentimentEnumMap, json['sleep']),
      $enumDecodeNullable(_$SentimentEnumMap, json['stress']),
      $enumDecodeNullable(_$SentimentEnumMap, json['diet']),
      $enumDecodeNullable(_$SentimentEnumMap, json['energy']),
    );

Map<String, dynamic> _$$_TrainingNotesModelToJson(
        _$_TrainingNotesModel instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'notes': instance.notes,
      'mood': _$SentimentEnumMap[instance.mood],
      'sleep': _$SentimentEnumMap[instance.sleep],
      'stress': _$SentimentEnumMap[instance.stress],
      'diet': _$SentimentEnumMap[instance.diet],
      'energy': _$SentimentEnumMap[instance.energy],
    };

const _$SentimentEnumMap = {
  Sentiment.veryPoor: 'veryPoor',
  Sentiment.poor: 'poor',
  Sentiment.neutral: 'neutral',
  Sentiment.good: 'good',
  Sentiment.veryGood: 'veryGood',
};
