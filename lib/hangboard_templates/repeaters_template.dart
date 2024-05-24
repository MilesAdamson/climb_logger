import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:climb_logger/hangboard_templates/hangboard_templates.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:uuid/uuid.dart';

class RepeatersTemplate extends HangboardTemplate {
  @override
  String get goalStatement =>
      "Repeaters train strength endurance. They have shorter rest and higher uptime. "
      "They Mimic the on/off sequence that is natural to climbing.";

  @override
  String get templateName => "Repeaters";

  RepeatersTemplate(
    HangboardDifficulty difficulty,
    MeasurementSystem measurementSystem,
  ) : super(difficulty, measurementSystem);

  @override
  HangboardRoutineModel build() {
    final date = DateTime.now();
    final name = "$templateName ${date.formattedDate}";
    late int pairsToGenerate;
    late int restMinutes;
    late int sets;

    switch (difficulty) {
      case HangboardDifficulty.beginner:
        restMinutes = 5;
        pairsToGenerate = 4;
        sets = 2;
        break;
      case HangboardDifficulty.moderate:
        restMinutes = 4;
        pairsToGenerate = 5;
        sets = 2;
        break;
      case HangboardDifficulty.advanced:
        restMinutes = 3;
        pairsToGenerate = 6;
        sets = 3;
        break;
      case HangboardDifficulty.expert:
        restMinutes = 2;
        pairsToGenerate = 6;
        sets = 3;
        break;
    }

    final items = <HangboardItemModel>[];

    for (int i = 0; i < pairsToGenerate; i++) {
      items.addAll([
        _hang(),
        _rest(),
      ]);
    }

    items.removeLast();

    return HangboardRoutineModel(
      name,
      date,
      difficulty.score,
      sets,
      restMinutes,
      0,
      items,
    );
  }

  HangboardItemModel _hang() {
    late int secondsOn;

    switch (difficulty) {
      case HangboardDifficulty.beginner:
        secondsOn = 6;
        break;
      case HangboardDifficulty.moderate:
        secondsOn = 8;
        break;
      case HangboardDifficulty.advanced:
        secondsOn = 8;
        break;
      case HangboardDifficulty.expert:
        secondsOn = 10;
        break;
    }

    return HangboardItemModel(
      _holdNameFromDifficulty(),
      null,
      _edgeSizeFromDifficulty(),
      secondsOn,
      0,
      const Uuid().v4(),
      false,
    );
  }

  HangboardItemModel _rest() {
    late int secondsOff;

    switch (difficulty) {
      case HangboardDifficulty.beginner:
        secondsOff = 10;
        break;
      case HangboardDifficulty.moderate:
        secondsOff = 8;
        break;
      case HangboardDifficulty.advanced:
        secondsOff = 6;
        break;
      case HangboardDifficulty.expert:
        secondsOff = 6;
        break;
    }

    return HangboardItemModel(
      HangboardItemModel.restItemName,
      null,
      null,
      secondsOff,
      0,
      const Uuid().v4(),
      false,
    );
  }

  String? _edgeSizeFromDifficulty() {
    switch (difficulty) {
      case HangboardDifficulty.beginner:
      case HangboardDifficulty.moderate:
        return null;
      case HangboardDifficulty.advanced:
        return measurementSystem == MeasurementSystem.metric
            ? HangboardItemModel.holdSizesMetric[6]
            : HangboardItemModel.holdSizesImperial[3];
      case HangboardDifficulty.expert:
        return measurementSystem == MeasurementSystem.metric
            ? HangboardItemModel.holdSizesMetric[2]
            : HangboardItemModel.holdSizesImperial[1];
    }
  }

  String _holdNameFromDifficulty() {
    switch (difficulty) {
      case HangboardDifficulty.beginner:
        return HangboardItemModel.itemNameJug;

      case HangboardDifficulty.moderate:
      case HangboardDifficulty.advanced:
      case HangboardDifficulty.expert:
        return HangboardItemModel.itemNameEdge;
    }
  }
}
