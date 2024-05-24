// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      SettingsModel settingsModel,
      @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
          bool isPaidUser,
      @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
          Map<int, String> trainingNotes,
      String? installedVersion) {
    return _UserModel(
      settingsModel,
      isPaidUser,
      trainingNotes,
      installedVersion,
    );
  }

  UserModel fromJson(Map<String, Object?> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  SettingsModel get settingsModel => throw _privateConstructorUsedError;
  @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
  bool get isPaidUser => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
  Map<int, String> get trainingNotes => throw _privateConstructorUsedError;
  String? get installedVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {SettingsModel settingsModel,
      @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
          bool isPaidUser,
      @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
          Map<int, String> trainingNotes,
      String? installedVersion});

  $SettingsModelCopyWith<$Res> get settingsModel;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? settingsModel = freezed,
    Object? isPaidUser = freezed,
    Object? trainingNotes = freezed,
    Object? installedVersion = freezed,
  }) {
    return _then(_value.copyWith(
      settingsModel: settingsModel == freezed
          ? _value.settingsModel
          : settingsModel // ignore: cast_nullable_to_non_nullable
              as SettingsModel,
      isPaidUser: isPaidUser == freezed
          ? _value.isPaidUser
          : isPaidUser // ignore: cast_nullable_to_non_nullable
              as bool,
      trainingNotes: trainingNotes == freezed
          ? _value.trainingNotes
          : trainingNotes // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      installedVersion: installedVersion == freezed
          ? _value.installedVersion
          : installedVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SettingsModelCopyWith<$Res> get settingsModel {
    return $SettingsModelCopyWith<$Res>(_value.settingsModel, (value) {
      return _then(_value.copyWith(settingsModel: value));
    });
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {SettingsModel settingsModel,
      @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
          bool isPaidUser,
      @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
          Map<int, String> trainingNotes,
      String? installedVersion});

  @override
  $SettingsModelCopyWith<$Res> get settingsModel;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? settingsModel = freezed,
    Object? isPaidUser = freezed,
    Object? trainingNotes = freezed,
    Object? installedVersion = freezed,
  }) {
    return _then(_UserModel(
      settingsModel == freezed
          ? _value.settingsModel
          : settingsModel // ignore: cast_nullable_to_non_nullable
              as SettingsModel,
      isPaidUser == freezed
          ? _value.isPaidUser
          : isPaidUser // ignore: cast_nullable_to_non_nullable
              as bool,
      trainingNotes == freezed
          ? _value.trainingNotes
          : trainingNotes // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      installedVersion == freezed
          ? _value.installedVersion
          : installedVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserModel extends _UserModel {
  _$_UserModel(
      this.settingsModel,
      @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
          this.isPaidUser,
      @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
          this.trainingNotes,
      this.installedVersion)
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final SettingsModel settingsModel;
  @override
  @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
  final bool isPaidUser;
  @override
  @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
  final Map<int, String> trainingNotes;
  @override
  final String? installedVersion;

  @override
  String toString() {
    return 'UserModel(settingsModel: $settingsModel, isPaidUser: $isPaidUser, trainingNotes: $trainingNotes, installedVersion: $installedVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            const DeepCollectionEquality()
                .equals(other.settingsModel, settingsModel) &&
            const DeepCollectionEquality()
                .equals(other.isPaidUser, isPaidUser) &&
            const DeepCollectionEquality()
                .equals(other.trainingNotes, trainingNotes) &&
            const DeepCollectionEquality()
                .equals(other.installedVersion, installedVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(settingsModel),
      const DeepCollectionEquality().hash(isPaidUser),
      const DeepCollectionEquality().hash(trainingNotes),
      const DeepCollectionEquality().hash(installedVersion));

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  factory _UserModel(
      SettingsModel settingsModel,
      @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
          bool isPaidUser,
      @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
          Map<int, String> trainingNotes,
      String? installedVersion) = _$_UserModel;
  _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  SettingsModel get settingsModel;
  @override
  @JsonKey(name: UserModel.paidUserKey, defaultValue: false)
  bool get isPaidUser;
  @override
  @JsonKey(defaultValue: <int, String>{}, name: UserModel.trainingNotesKey)
  Map<int, String> get trainingNotes;
  @override
  String? get installedVersion;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
