import 'package:climb_logger/util/int_list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("maxOrDefault", () {
    test("maxOrDefault returns default for empty list", () {
      final result = <int>[].maxOrDefault(6);
      expect(result, 6);
    });

    test("maxOrDefault returns max for populated list", () {
      final result = <int>[1, 3].maxOrDefault(6);
      expect(result, 3);
    });
  });
}
