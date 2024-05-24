// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangboard_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HangboardEntryModel _$$_HangboardEntryModelFromJson(
        Map<String, dynamic> json) =>
    _$_HangboardEntryModel(
      HangboardRoutineModel.fromJson(json['hangboardRoutine']),
      const TimestampConverter().fromJson(json['timestamp'] as Timestamp?),
    );

Map<String, dynamic> _$$_HangboardEntryModelToJson(
        _$_HangboardEntryModel instance) =>
    <String, dynamic>{
      'hangboardRoutine': instance.hangboardRoutine.toJson(),
      'timestamp': const TimestampConverter().toJson(instance.dateTime),
    };
