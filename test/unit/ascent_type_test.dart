import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedValues = <dynamic, AscentType?>{
    "redpoint": AscentType.redpoint,
    "redpointed": AscentType.redpoint,
    " redpoint ": AscentType.redpoint,
    " REDPoINT ": AscentType.redpoint,
    "flash": AscentType.flash,
    " Flash ": AscentType.flash,
    " Flashed ": AscentType.flash,
    " FlaSh ": AscentType.flash,
    "onsight": AscentType.onsight,
    " Onsight ": AscentType.onsight,
    " OnSighT ": AscentType.onsight,
    " OndwqdSighT ": null,
    1: null,
    "v4": null,
  };

  expectedValues.forEach((input, expectedAscentType) {
    test('An input of "$input" should parse to $expectedAscentType', () {
      expect(AscentTypeExtensions.tryParse(input), equals(expectedAscentType));
    });
  });
}
