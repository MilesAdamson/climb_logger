import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/wall_type.dart';

class PieChartWallTypeData {
  final WallType wallType;
  final double percent;

  String get percentLabel {
    int p = (percent * 100).round();
    return "$p%";
  }

  PieChartWallTypeData(
    this.wallType,
    this.percent,
  );

  static List<PieChartWallTypeData> fromLogbookEntries(
      List<LogbookEntryModel> logbookEntries) {
    final resultMap = <WallType, double>{
      for (var type in WallType.values) type: 0.0
    };

    for (final entry in logbookEntries) {
      resultMap[entry.wallType] = resultMap[entry.wallType]! + 1.0;
    }

    final length = logbookEntries.length;

    return resultMap.keys
        .map((type) => PieChartWallTypeData(type, resultMap[type]! / length))
        .toList();
  }
}
