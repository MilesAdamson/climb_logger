// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hangboard_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HangboardItemModel _$$_HangboardItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_HangboardItemModel(
      json['name'] as String? ?? '?',
      json['modifier'] as String?,
      json['holdSize'] as String?,
      json['seconds'] as int? ?? 10,
      json['minutes'] as int? ?? 0,
      json['uniqueId'] as String,
      json['isRestBetweenSets'] as bool? ?? false,
    );

Map<String, dynamic> _$$_HangboardItemModelToJson(
        _$_HangboardItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'modifier': instance.modifier,
      'holdSize': instance.holdSize,
      'seconds': instance.seconds,
      'minutes': instance.minutes,
      'uniqueId': instance.uniqueId,
      'isRestBetweenSets': instance.isRestBetweenSets,
    };
