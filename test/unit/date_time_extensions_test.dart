import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedValues = <dynamic, DateTime?>{
    "1993/10/20": DateTime(1993, 10, 20),
    "Jan 23, 1999": DateTime(1999, 1, 23),
    "Jan 23 1999": DateTime(1999, 1, 23),
    "feb 4 2020": DateTime(2020, 2, 4),
    "APR 7 2020": DateTime(2020, 4, 7),
    " OndwqdSighT ": null,
    1: null,
    "v4": null,
  };

  expectedValues.forEach((input, expectedDate) {
    test('An input of "$input" should parse to $expectedDate', () {
      expect(DateTimeExtensions.tryParse(input), equals(expectedDate));
    });
  });
}
