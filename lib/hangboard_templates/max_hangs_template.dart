import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:climb_logger/hangboard_templates/hangboard_templates.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:uuid/uuid.dart';

class MaxHangsTemplate extends HangboardTemplate {
  @override
  String get goalStatement => "This routine has low volume and high intensity. "
      "It follows roughly what weight lifters do for strength and power: "
      "few reps and sets with ample rest in between.";

  @override
  String get templateName => "Max Hangs";

  MaxHangsTemplate(
    HangboardDifficulty difficulty,
    MeasurementSystem measurementSystem,
  ) : super(difficulty, measurementSystem);

  @override
  HangboardRoutineModel build() {
    final date = DateTime.now();
    final name = "$templateName ${date.formattedDate}";

    return HangboardRoutineModel(
      name,
      date,
      difficulty.score,
      4,
      3,
      0,
      [_hang()],
    );
  }

  HangboardItemModel _hang() {
    return HangboardItemModel(
      HangboardItemModel.itemNameEdge,
      _modifierFromDifficulty(),
      _edgeSizeFromDifficulty(),
      10,
      0,
      const Uuid().v4(),
      false,
    );
  }

  String? _edgeSizeFromDifficulty() {
    switch (difficulty) {
      case HangboardDifficulty.beginner:
        return measurementSystem == MeasurementSystem.metric
            ? HangboardItemModel.holdSizesMetric[12]
            : HangboardItemModel.holdSizesImperial[8];

      case HangboardDifficulty.moderate:
        return measurementSystem == MeasurementSystem.metric
            ? HangboardItemModel.holdSizesMetric[8]
            : HangboardItemModel.holdSizesImperial[5];

      case HangboardDifficulty.advanced:
        return measurementSystem == MeasurementSystem.metric
            ? HangboardItemModel.holdSizesMetric[6]
            : HangboardItemModel.holdSizesImperial[3];

      case HangboardDifficulty.expert:
        return measurementSystem == MeasurementSystem.metric
            ? HangboardItemModel.holdSizesMetric[3]
            : HangboardItemModel.holdSizesImperial[2];
    }
  }

  String? _modifierFromDifficulty() {
    switch (difficulty) {
      case HangboardDifficulty.beginner:
      case HangboardDifficulty.moderate:
        return null;

      case HangboardDifficulty.advanced:
      case HangboardDifficulty.expert:
        return HangboardItemModel.itemModifierWeighted;
    }
  }
}
