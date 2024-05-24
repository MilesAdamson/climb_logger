// ignore_for_file: invalid_annotation_target

import 'package:climb_logger/models/beta_model.dart';
import 'package:climb_logger/models/converters/timestamp_converter.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  ProjectModel._();

  @JsonSerializable(explicitToJson: true)
  factory ProjectModel(
    @JsonKey(defaultValue: "V1") String gradeLabel,
    @JsonKey(defaultValue: "Project Name") String name,
    @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
    @JsonKey(defaultValue: WallType.overhang) WallType wallType,
    @TimestampConverter() DateTime createdAt,
    @JsonKey(defaultValue: <String>[]) List<String> relatedLogbookEntryIds,
    @JsonKey(defaultValue: <String>[]) List<String> tags,
    @JsonKey(defaultValue: <String>[]) List<BetaModel> beta,
  ) = _ProjectModel;

  String get createdAtLabel => createdAt.formattedDateAndTime;

  factory ProjectModel.fromJson(json) => _$ProjectModelFromJson(json);
}
