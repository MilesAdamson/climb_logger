// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
class _$ProjectModelTearOff {
  const _$ProjectModelTearOff();

  _ProjectModel call(
      @JsonKey(defaultValue: "V1") String gradeLabel,
      @JsonKey(defaultValue: "Project Name") String name,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang) WallType wallType,
      @TimestampConverter() DateTime createdAt,
      @JsonKey(defaultValue: <String>[]) List<String> relatedLogbookEntryIds,
      @JsonKey(defaultValue: <String>[]) List<String> tags,
      @JsonKey(defaultValue: <String>[]) List<BetaModel> beta) {
    return _ProjectModel(
      gradeLabel,
      name,
      climbType,
      wallType,
      createdAt,
      relatedLogbookEntryIds,
      tags,
      beta,
    );
  }

  ProjectModel fromJson(Map<String, Object?> json) {
    return ProjectModel.fromJson(json);
  }
}

/// @nodoc
const $ProjectModel = _$ProjectModelTearOff();

/// @nodoc
mixin _$ProjectModel {
  @JsonKey(defaultValue: "V1")
  String get gradeLabel => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: "Project Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: WallType.overhang)
  WallType get wallType => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get relatedLogbookEntryIds => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<BetaModel> get beta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: "V1") String gradeLabel,
      @JsonKey(defaultValue: "Project Name") String name,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang) WallType wallType,
      @TimestampConverter() DateTime createdAt,
      @JsonKey(defaultValue: <String>[]) List<String> relatedLogbookEntryIds,
      @JsonKey(defaultValue: <String>[]) List<String> tags,
      @JsonKey(defaultValue: <String>[]) List<BetaModel> beta});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res> implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  final ProjectModel _value;
  // ignore: unused_field
  final $Res Function(ProjectModel) _then;

  @override
  $Res call({
    Object? gradeLabel = freezed,
    Object? name = freezed,
    Object? climbType = freezed,
    Object? wallType = freezed,
    Object? createdAt = freezed,
    Object? relatedLogbookEntryIds = freezed,
    Object? tags = freezed,
    Object? beta = freezed,
  }) {
    return _then(_value.copyWith(
      gradeLabel: gradeLabel == freezed
          ? _value.gradeLabel
          : gradeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      climbType: climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      wallType: wallType == freezed
          ? _value.wallType
          : wallType // ignore: cast_nullable_to_non_nullable
              as WallType,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      relatedLogbookEntryIds: relatedLogbookEntryIds == freezed
          ? _value.relatedLogbookEntryIds
          : relatedLogbookEntryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      beta: beta == freezed
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as List<BetaModel>,
    ));
  }
}

/// @nodoc
abstract class _$ProjectModelCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(
          _ProjectModel value, $Res Function(_ProjectModel) then) =
      __$ProjectModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: "V1") String gradeLabel,
      @JsonKey(defaultValue: "Project Name") String name,
      @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang) WallType wallType,
      @TimestampConverter() DateTime createdAt,
      @JsonKey(defaultValue: <String>[]) List<String> relatedLogbookEntryIds,
      @JsonKey(defaultValue: <String>[]) List<String> tags,
      @JsonKey(defaultValue: <String>[]) List<BetaModel> beta});
}

/// @nodoc
class __$ProjectModelCopyWithImpl<$Res> extends _$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(
      _ProjectModel _value, $Res Function(_ProjectModel) _then)
      : super(_value, (v) => _then(v as _ProjectModel));

  @override
  _ProjectModel get _value => super._value as _ProjectModel;

  @override
  $Res call({
    Object? gradeLabel = freezed,
    Object? name = freezed,
    Object? climbType = freezed,
    Object? wallType = freezed,
    Object? createdAt = freezed,
    Object? relatedLogbookEntryIds = freezed,
    Object? tags = freezed,
    Object? beta = freezed,
  }) {
    return _then(_ProjectModel(
      gradeLabel == freezed
          ? _value.gradeLabel
          : gradeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      climbType == freezed
          ? _value.climbType
          : climbType // ignore: cast_nullable_to_non_nullable
              as ClimbType,
      wallType == freezed
          ? _value.wallType
          : wallType // ignore: cast_nullable_to_non_nullable
              as WallType,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      relatedLogbookEntryIds == freezed
          ? _value.relatedLogbookEntryIds
          : relatedLogbookEntryIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      beta == freezed
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as List<BetaModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ProjectModel extends _ProjectModel {
  _$_ProjectModel(
      @JsonKey(defaultValue: "V1") this.gradeLabel,
      @JsonKey(defaultValue: "Project Name") this.name,
      @JsonKey(defaultValue: ClimbType.boulder) this.climbType,
      @JsonKey(defaultValue: WallType.overhang) this.wallType,
      @TimestampConverter() this.createdAt,
      @JsonKey(defaultValue: <String>[]) this.relatedLogbookEntryIds,
      @JsonKey(defaultValue: <String>[]) this.tags,
      @JsonKey(defaultValue: <String>[]) this.beta)
      : super._();

  factory _$_ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectModelFromJson(json);

  @override
  @JsonKey(defaultValue: "V1")
  final String gradeLabel;
  @override
  @JsonKey(defaultValue: "Project Name")
  final String name;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  final ClimbType climbType;
  @override
  @JsonKey(defaultValue: WallType.overhang)
  final WallType wallType;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @JsonKey(defaultValue: <String>[])
  final List<String> relatedLogbookEntryIds;
  @override
  @JsonKey(defaultValue: <String>[])
  final List<String> tags;
  @override
  @JsonKey(defaultValue: <String>[])
  final List<BetaModel> beta;

  @override
  String toString() {
    return 'ProjectModel(gradeLabel: $gradeLabel, name: $name, climbType: $climbType, wallType: $wallType, createdAt: $createdAt, relatedLogbookEntryIds: $relatedLogbookEntryIds, tags: $tags, beta: $beta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectModel &&
            const DeepCollectionEquality()
                .equals(other.gradeLabel, gradeLabel) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.climbType, climbType) &&
            const DeepCollectionEquality().equals(other.wallType, wallType) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.relatedLogbookEntryIds, relatedLogbookEntryIds) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.beta, beta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gradeLabel),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(climbType),
      const DeepCollectionEquality().hash(wallType),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(relatedLogbookEntryIds),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(beta));

  @JsonKey(ignore: true)
  @override
  _$ProjectModelCopyWith<_ProjectModel> get copyWith =>
      __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectModelToJson(this);
  }
}

abstract class _ProjectModel extends ProjectModel {
  factory _ProjectModel(
      @JsonKey(defaultValue: "V1")
          String gradeLabel,
      @JsonKey(defaultValue: "Project Name")
          String name,
      @JsonKey(defaultValue: ClimbType.boulder)
          ClimbType climbType,
      @JsonKey(defaultValue: WallType.overhang)
          WallType wallType,
      @TimestampConverter()
          DateTime createdAt,
      @JsonKey(defaultValue: <String>[])
          List<String> relatedLogbookEntryIds,
      @JsonKey(defaultValue: <String>[])
          List<String> tags,
      @JsonKey(defaultValue: <String>[])
          List<BetaModel> beta) = _$_ProjectModel;
  _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectModel.fromJson;

  @override
  @JsonKey(defaultValue: "V1")
  String get gradeLabel;
  @override
  @JsonKey(defaultValue: "Project Name")
  String get name;
  @override
  @JsonKey(defaultValue: ClimbType.boulder)
  ClimbType get climbType;
  @override
  @JsonKey(defaultValue: WallType.overhang)
  WallType get wallType;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get relatedLogbookEntryIds;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get tags;
  @override
  @JsonKey(defaultValue: <String>[])
  List<BetaModel> get beta;
  @override
  @JsonKey(ignore: true)
  _$ProjectModelCopyWith<_ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}
