import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:collection/collection.dart';

final gradeMap = {
  const VerminSystem().systemKey: const VerminSystem(),
  const FrenchBoulderingSystem().systemKey: const FrenchBoulderingSystem(),
  const YosemiteSystem().systemKey: const YosemiteSystem(),
  const FrenchSportSystem().systemKey: const FrenchSportSystem(),
};

abstract class GradingSystem {
  List<String> get labels;
  ClimbType get climbType;
  String get systemKey;
  String get label;
  int get baseScoreValue;
  ChartYAxisType get chartYAxisType;

  // for grades which do not exist, used for axis labels
  List<String> get extensionLabels;

  const GradingSystem();

  @override
  int get hashCode => systemKey.hashCode;

  @override
  bool operator ==(Object other) =>
      other is GradingSystem && other.systemKey == systemKey;

  static String? tryParse(input) {
    final trimmed = "$input".trim();

    for (final systemKey in gradeMap.keys) {
      final match = gradeMap[systemKey]!
          .labels
          .firstWhereOrNull((gradeLabel) => trimmed == gradeLabel);

      if (match != null) {
        return match;
      }
    }

    return null;
  }
}

class VerminSystem extends GradingSystem {
  @override
  String get systemKey => "vermin";

  @override
  String get label => "V-grades";

  const VerminSystem();

  @override
  ClimbType get climbType => ClimbType.boulder;

  @override
  List<String> get labels => [
        "Vb-",
        "Vb",
        "V0",
        "V1",
        "V2",
        "V3",
        "V4",
        "V5",
        "V6",
        "V7",
        "V8",
        "V9",
        "V10",
        "V11",
        "V12",
        "V13",
        "V14",
        "V15",
        "V16",
        "V17",
      ];

  @override
  int get baseScoreValue => 75;

  @override
  List<String> get extensionLabels => [
        "V18",
        "V19",
        "V20",
      ];

  @override
  ChartYAxisType get chartYAxisType => ChartYAxisType.bouldering;
}

class FrenchBoulderingSystem extends GradingSystem {
  @override
  String get systemKey => "frenchBouldering";

  @override
  String get label => "French";

  const FrenchBoulderingSystem();

  @override
  ClimbType get climbType => ClimbType.boulder;

  @override
  List<String> get labels => [
        "3",
        "4A",
        "4B",
        "4C",
        "5A",
        "5B",
        "5C",
        "6A",
        "6A+",
        "6B",
        "6B+",
        "6C",
        "6C+",
        "7A",
        "7A+",
        "7B",
        "7B+",
        "7C",
        "7C+",
        "8A",
        "8A+",
        "8B",
        "8B+",
        "8C",
        "8C+",
        "9A",
        "9A+",
      ];

  @override
  int get baseScoreValue => 50;

  @override
  List<String> get extensionLabels => [
        "9B",
        "9B+",
        "9C",
      ];

  @override
  ChartYAxisType get chartYAxisType => ChartYAxisType.bouldering;
}

class FrenchSportSystem extends GradingSystem {
  @override
  String get systemKey => "frenchSport";

  @override
  String get label => "French";

  const FrenchSportSystem();

  @override
  ClimbType get climbType => ClimbType.sport;

  @override
  List<String> get labels => [
        "3",
        "4a",
        "4b",
        "4c",
        "5a",
        "5b",
        "5c",
        "6a",
        "6a+",
        "6b",
        "6b+",
        "6c",
        "6c+",
        "7a",
        "7a+",
        "7b",
        "7b+",
        "7c",
        "7c+",
        "8a",
        "8a+",
        "8b",
        "8b+",
        "8c",
        "8c+",
        "9a",
        "9a+",
        "9b",
        "9b+",
        "9c",
      ];

  @override
  int get baseScoreValue => 50;

  @override
  List<String> get extensionLabels => [
        "9c+",
        "10a",
        "10a+",
      ];

  @override
  ChartYAxisType get chartYAxisType => ChartYAxisType.sport;
}

class YosemiteSystem extends GradingSystem {
  @override
  String get systemKey => "yosemite";

  @override
  String get label => "Yosemite";

  const YosemiteSystem();

  @override
  ClimbType get climbType => ClimbType.sport;

  @override
  List<String> get labels => [
        "5.7",
        "5.8",
        "5.9",
        "10a",
        "10b",
        "10c",
        "10d",
        "11a",
        "11b",
        "11c",
        "11d",
        "12a",
        "12b",
        "12c",
        "12d",
        "13a",
        "13b",
        "13c",
        "13d",
        "14a",
        "14b",
        "14c",
        "14d",
        "15a",
        "15b",
        "15c",
        "15d",
      ];

  @override
  int get baseScoreValue => 50;

  @override
  List<String> get extensionLabels => [
        "16a",
        "16b",
        "16c",
      ];

  @override
  ChartYAxisType get chartYAxisType => ChartYAxisType.sport;
}
