// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  static const paidUserKey = "isPaidUser";
  static const trainingNotesKey = "trainingNotes";

  UserModel._();

  @JsonSerializable(explicitToJson: true)
  factory UserModel(
    SettingsModel settingsModel,
    @JsonKey(name: UserModel.paidUserKey, defaultValue: false) bool isPaidUser,
    @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
        Map<int, String> trainingNotes,
    String? installedVersion,
  ) = _UserModel;

  factory UserModel.fromJson(json) => _$UserModelFromJson(json);

  factory UserModel.newUser() {
    return UserModel(
      SettingsModel.defaultValues(),
      false,
      <int, String>{},
      null,
    );
  }
}
