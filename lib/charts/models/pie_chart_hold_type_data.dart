import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:collection/collection.dart';

class PieChartHoldTypeData {
  final String holdType;
  final double percent;

  String get percentLabel {
    int p = (percent * 100).round();
    return "$p%";
  }

  PieChartHoldTypeData(
    this.holdType,
    this.percent,
  );

  static List<PieChartHoldTypeData> fromLogbookEntries(
      List<HangboardEntryModel> entries) {
    final resultMap = <String, double>{
      for (var itemName in HangboardItemModel.itemNames) itemName: 0.0
    };

    for (final entry in entries) {
      final completeWorkout = entry.hangboardRoutine.completeWorkout;
      for (final item in completeWorkout) {
        // Filter off countdown and rest
        final holdName = HangboardItemModel.itemNames
            .firstWhereOrNull((name) => item.name.contains(name));

        if (holdName != null) {
          resultMap[holdName] = resultMap[holdName]! + item.duration.inSeconds;
        }
      }
    }

    final length = entries.length;

    return resultMap.keys
        .map((type) => PieChartHoldTypeData(type, resultMap[type]! / length))
        .toList();
  }
}
