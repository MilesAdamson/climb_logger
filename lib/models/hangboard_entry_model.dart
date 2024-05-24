// ignore_for_file: invalid_annotation_target

import 'dart:math';

import 'package:climb_logger/models/converters/timestamp_converter.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'hangboard_entry_model.freezed.dart';
part 'hangboard_entry_model.g.dart';

@freezed
class HangboardEntryModel with _$HangboardEntryModel {
  HangboardEntryModel._();

  int get score => hangboardRoutine.score;

  String get title => hangboardRoutine.name;

  String get dateSubtitle => dateTime.formattedTime;

  @JsonSerializable(explicitToJson: true)
  factory HangboardEntryModel(
    HangboardRoutineModel hangboardRoutine,
    @TimestampConverter()
    @JsonKey(name: LogbookEntryModel.keyTimestamp)
        DateTime dateTime,
  ) = _HangboardEntryModel;

  factory HangboardEntryModel.fromJson(json) =>
      _$HangboardEntryModelFromJson(json);

  factory HangboardEntryModel.randomEntry(MeasurementSystem measurementSystem) {
    final random = Random();
    final routine = HangboardRoutineModel(
      "name",
      DateTime.now(),
      500,
      1,
      1,
      1,
      List.generate(
        50,
        (i) => _randomHangboardItemModel(random, measurementSystem),
      ),
    );

    return HangboardEntryModel(
      routine,
      DateTime.now().subtract(Duration(
        days: random.nextInt(20),
        hours: random.nextInt(24),
        minutes: random.nextInt(60),
        seconds: random.nextInt(60),
      )),
    );
  }

  static HangboardItemModel _randomHangboardItemModel(
    Random random,
    MeasurementSystem measurementSystem,
  ) {
    final sizes = measurementSystem == MeasurementSystem.imperial
        ? HangboardItemModel.holdSizesImperial
        : HangboardItemModel.holdSizesMetric;

    return HangboardItemModel(
      HangboardItemModel.itemNames
          .elementAt(random.nextInt(HangboardItemModel.itemNames.length)),
      random.nextInt(3) == 1
          ? HangboardItemModel.modifiers
              .elementAt(random.nextInt(HangboardItemModel.modifiers.length))
          : null,
      random.nextInt(2) == 1
          ? sizes.elementAt(random.nextInt(sizes.length))
          : null,
      random.nextInt(30),
      0,
      const Uuid().v4(),
      false,
    );
  }
}
