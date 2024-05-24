import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/util/int_list_extensions.dart';

class BestHangData {
  final DateTime dateTime;
  final String holdSize;
  final int secondsHeld;

  BestHangData(
    this.dateTime,
    this.holdSize,
    this.secondsHeld,
  );

  static Map<String, List<BestHangData>> fromHangboardEntries(
    List<HangboardEntryModel> entries,
    List<String> holdSizes,
  ) {
    final mapOfHoldSizeAndData = <String, List<BestHangData>>{};

    for (final holdSize in holdSizes) {
      final data = <BestHangData>[];

      final sortedEntries = entries
        ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

      int currentBest = 0;

      for (final entry in sortedEntries) {
        final hangboardItems = entry.hangboardRoutine.nonRestItems
            .where((item) => item.holdSize == holdSize);

        final maxSeconds =
            hangboardItems.map((e) => e.duration.inSeconds).maxOrDefault(0);

        if (maxSeconds > currentBest) {
          data.add(BestHangData(
            entry.dateTime.subtract(const Duration(seconds: 1)),
            holdSize,
            currentBest,
          ));
          currentBest = maxSeconds;
        }

        data.add(BestHangData(
          entry.dateTime,
          holdSize,
          currentBest,
        ));
      }

      mapOfHoldSizeAndData[holdSize] = data;
    }

    return mapOfHoldSizeAndData;
  }
}
