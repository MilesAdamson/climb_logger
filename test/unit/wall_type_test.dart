import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final expectedValues = <dynamic, WallType?>{
    "oVerHang": WallType.overhang,
    "overhang": WallType.overhang,
    " OverHang ": WallType.overhang,
    " overhang ": WallType.overhang,
    "rOof": WallType.roof,
    " ROOF ": WallType.roof,
    " roof ": WallType.roof,
    " SLAB ": WallType.slab,
    "slab": WallType.slab,
    " VeRT ": WallType.vert,
    " vert ": WallType.vert,
    " OndwqdSighT ": null,
    1: null,
    "v4": null,
  };

  expectedValues.forEach((input, expectedWallType) {
    test('An input of "$input" should parse to $expectedWallType', () {
      expect(WallTypeExtensions.tryParse(input), equals(expectedWallType));
    });
  });
}
