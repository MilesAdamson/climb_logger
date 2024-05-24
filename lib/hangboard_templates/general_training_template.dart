import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:climb_logger/hangboard_templates/hangboard_templates.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:uuid/uuid.dart';

class GeneralTrainingTemplate extends HangboardTemplate {
  @override
  String get goalStatement =>
      "This routine has a variety of hold types for overall improvement.";

  @override
  String get templateName => "General Training";

  GeneralTrainingTemplate(
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
      _sets(),
      1,
      0,
      _buildSet(),
    );
  }

  List<HangboardItemModel> _buildSet() {
    return [
      _hang(difficulty == HangboardDifficulty.beginner
          ? HangboardItemModel.itemNameJug
          : HangboardItemModel.itemNamePocket),
      _shortRest(),
      _hang(HangboardItemModel.itemNameEdge),
      _shortRest(),
      _hang(HangboardItemModel.itemNameSloper),
      _shortRest(),
      _hang(HangboardItemModel.itemNamePinch),
    ];
  }

  int _sets() {
    switch (difficulty) {
      case HangboardDifficulty.beginner:
        return 4;
      case HangboardDifficulty.moderate:
        return 4;
      case HangboardDifficulty.advanced:
        return 5;
      case HangboardDifficulty.expert:
        return 5;
    }
  }

  HangboardItemModel _hang(String holdName) {
    late int seconds;
    switch (difficulty) {
      case HangboardDifficulty.beginner:
        seconds = 4;
        break;
      case HangboardDifficulty.moderate:
        seconds = 6;
        break;
      case HangboardDifficulty.advanced:
        seconds = 8;
        break;
      case HangboardDifficulty.expert:
        seconds = 10;
        break;
    }

    return HangboardItemModel(
      holdName,
      null,
      null,
      seconds,
      0,
      const Uuid().v4(),
      false,
    );
  }

  HangboardItemModel _shortRest() {
    late int seconds;
    switch (difficulty) {
      case HangboardDifficulty.beginner:
        seconds = 10;
        break;
      case HangboardDifficulty.moderate:
        seconds = 8;
        break;
      case HangboardDifficulty.advanced:
        seconds = 6;
        break;
      case HangboardDifficulty.expert:
        seconds = 4;
        break;
    }

    return HangboardItemModel.rest(seconds: seconds, minutes: 0);
  }
}
