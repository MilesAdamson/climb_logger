// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      SettingsModel.fromJson(json['settingsModel']),
      json['isPaidUser'] as bool? ?? false,
      (json['trainingNotes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(int.parse(k), e as String),
          ) ??
          {},
      json['installedVersion'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'settingsModel': instance.settingsModel.toJson(),
      'isPaidUser': instance.isPaidUser,
      'trainingNotes':
          instance.trainingNotes.map((k, e) => MapEntry(k.toString(), e)),
      'installedVersion': instance.installedVersion,
    };
