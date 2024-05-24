import 'package:climb_logger/util/grading_system.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedValues = <dynamic, String?>{
    "v4": null,
    "V4": const VerminSystem().labels[6],
    "V20": null,
    "V10": const VerminSystem().labels[12],
    "Vb-": const VerminSystem().labels[0],
    "6A": const FrenchBoulderingSystem().labels[7],
    "6a": const FrenchSportSystem().labels[7],
    " 6a ": const FrenchSportSystem().labels[7],
    " 5.9 ": const YosemiteSystem().labels[2],
    " 10a ": const YosemiteSystem().labels[3],
  };

  expectedValues.forEach((input, expectedGrade) {
    test('An input of "$input" should parse to $expectedGrade', () {
      expect(GradingSystem.tryParse(input), equals(expectedGrade));
    });
  });
}
