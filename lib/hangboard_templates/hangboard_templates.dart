import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/util/measurement_system.dart';

abstract class HangboardTemplate {
  final HangboardDifficulty difficulty;
  final MeasurementSystem measurementSystem;

  String get goalStatement;
  String get templateName;

  HangboardTemplate(this.difficulty, this.measurementSystem);
  HangboardRoutineModel build();
}
