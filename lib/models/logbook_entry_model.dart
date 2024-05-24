// ignore_for_file: invalid_annotation_target

import 'dart:math';

import 'package:climb_logger/models/converters/timestamp_converter.dart';
import 'package:climb_logger/models/settings_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logbook_entry_model.freezed.dart';
part 'logbook_entry_model.g.dart';

@freezed
class LogbookEntryModel with _$LogbookEntryModel {
  static const keyTimestamp = "timestamp";

  String get title {
    final s = climbName?.trim();
    if (s != null && s.isNotEmpty) {
      return s;
    }

    return "${wallType.label} ${ascentType.label}";
  }

  String get formattedDate => dateTime.formattedDate;

  String get formattedDateAndTime => dateTime.formattedDateAndTime;

  String get subtitle {
    final s = details?.trim();
    if (s != null && s.isNotEmpty) {
      return "${dateTime.formattedTime}: $s";
    }

    return dateTime.formattedTime;
  }

  String get projectSubtitle {
    final s = details?.trim();
    if (s != null && s.isNotEmpty) {
      return s;
    }

    return "$attempts attempts";
  }

  LogbookEntryModel._();

  @JsonSerializable()
  factory LogbookEntryModel(
    @TimestampConverter()
    @JsonKey(name: LogbookEntryModel.keyTimestamp)
        DateTime dateTime,
    String? details,
    String? climbName,
    @JsonKey(defaultValue: "?") String gradeLabel,
    @JsonKey(defaultValue: ClimbType.boulder) ClimbType climbType,
    @JsonKey(defaultValue: AscentType.redpoint) AscentType ascentType,
    @JsonKey(defaultValue: <String>[]) List<String> tags,
    @JsonKey(defaultValue: WallType.overhang) WallType wallType,
    int? attempts,
  ) = _LogbookEntryModel;

  factory LogbookEntryModel.fromJson(json) => _$LogbookEntryModelFromJson(json);

  factory LogbookEntryModel.randomEntry(
      GradingSystem gradingSystem, List<String> tags) {
    var firstTags = tags.take(3).toList();

    if (firstTags.isEmpty) {
      firstTags = SettingsModel.defaultTags.take(3).toList();
    }

    final random = Random();

    return LogbookEntryModel(
      DateTime.now().subtract(Duration(
        days: random.nextInt(10),
        hours: random.nextInt(24),
        minutes: random.nextInt(60),
        seconds: random.nextInt(60),
      )),
      null,
      null,
      gradingSystem.labels[random.nextInt(gradingSystem.labels.length ~/ 1.5)],
      ClimbType.values[random.nextInt(ClimbType.values.length)],
      AscentType.values[random.nextInt(AscentType.values.length)],
      [
        firstTags[random.nextInt(firstTags.length)],
        firstTags[random.nextInt(firstTags.length)],
        firstTags[random.nextInt(firstTags.length)],
      ],
      WallType.values[random.nextInt(WallType.values.length)],
      null,
    );
  }

  GradingSystem get gradingSystem {
    final isFrenchDeprecatedGrade = ["3", "4", "5"].contains(gradeLabel);

    switch (climbType) {
      case ClimbType.boulder:
        if (const FrenchBoulderingSystem().labels.contains(gradeLabel) ||
            isFrenchDeprecatedGrade) {
          return const FrenchBoulderingSystem();
        }

        return const VerminSystem();

      case ClimbType.sport:
        if (const FrenchSportSystem().labels.contains(gradeLabel) ||
            isFrenchDeprecatedGrade) {
          return const FrenchSportSystem();
        }

        return const YosemiteSystem();
    }
  }

  int get gradeIndex => gradingSystem.labels.indexOf(gradeLabel);

  int get score {
    if (ascentType == AscentType.project) {
      return 0;
    }

    int i = gradingSystem.labels.indexOf(gradeLabel) + 1;
    if (ascentType == AscentType.flash) {
      i++;
    } else if (ascentType == AscentType.onsight) {
      i += 2;
    }

    return gradingSystem.baseScoreValue * i;
  }

  static List<String> csvTitles(List<String> allTags) => <String>[
        "Date",
        "Grade",
        "Grade Index",
        "Climb Type",
        "Ascent Type",
        "Attempts",
        "Wall Type",
        "Climb Name",
        "Details",
        ...allTags,
      ];

  List<dynamic> csvEntry(List<String> allTags) => [
        formattedDateAndTime,
        gradeLabel,
        gradeIndex,
        climbType.label,
        ascentType.label,
        attempts ?? "",
        wallType.label,
        climbName ?? "",
        details ?? "",
        ...allTags.map((tag) => tags.contains(tag) ? "Yes" : ""),
      ];
}
