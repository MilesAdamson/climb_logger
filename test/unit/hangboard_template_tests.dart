import 'package:climb_logger/hangboard_templates/general_training_template.dart';
import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:climb_logger/hangboard_templates/hangboard_templates.dart';
import 'package:climb_logger/hangboard_templates/max_hangs_template.dart';
import 'package:climb_logger/hangboard_templates/repeaters_template.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("$HangboardTemplate tests", () {
    for (final d in HangboardDifficulty.values) {
      for (final m in MeasurementSystem.values) {
        test(
            "$GeneralTrainingTemplate can be built with ${d.name} and ${m.name}",
            () {
          expect(
            () => GeneralTrainingTemplate(d, m).build(),
            returnsNormally,
          );
        });

        test("$RepeatersTemplate can be built with ${d.name} and ${m.name}",
            () {
          expect(
            () => RepeatersTemplate(d, m).build(),
            returnsNormally,
          );
        });

        test("$MaxHangsTemplate can be built with ${d.name} and ${m.name}", () {
          expect(
            () => MaxHangsTemplate(d, m).build(),
            returnsNormally,
          );
        });
      }
    }
  });
}
