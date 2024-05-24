import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/models/hangboard_chart_settings_model.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/format_minutes_and_seconds.dart';
import 'package:climb_logger/util/hangboard_chart_type.dart';
import 'package:climb_logger/util/measurement_system.dart';
import 'package:climb_logger/util/sort_hold_sizes.dart';
import 'package:flutter/material.dart';

Future<HangboardChartSettingsModel?> showHangboardChartSettingsBottomSheet(
  BuildContext context,
  HangboardChartType hangboardChartType,
) async {
  return showModalBottomSheet<HangboardChartSettingsModel>(
    isDismissible: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: BottomSheetHeading.sheetShape,
    context: context,
    builder: (context) => HangboardChartSettingsBottomSheet(
        hangboardChartType: hangboardChartType),
  );
}

class HangboardChartSettingsBottomSheet extends StatefulWidget {
  final HangboardChartType hangboardChartType;

  const HangboardChartSettingsBottomSheet({
    Key? key,
    required this.hangboardChartType,
  }) : super(key: key);

  @override
  State<HangboardChartSettingsBottomSheet> createState() =>
      HangboardChartSettingsBottomSheetState();
}

class HangboardChartSettingsBottomSheetState
    extends State<HangboardChartSettingsBottomSheet> {
  late final settings = context.bloc.state.settings;
  var selectedHoldSizes = <String>[];

  HangboardChartSettingsModel get chartSettings => HangboardChartSettingsModel(
        sortHoldSizes(selectedHoldSizes),
      );

  String? get submissionError {
    if (selectedHoldSizes.isEmpty &&
        widget.hangboardChartType.shouldPromptForHoldSizes) {
      return "You must select at least one hold size";
    }

    // no error
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomSheetHeight(context),
      child: DraggableScrollableSheet(
        maxChildSize: 1,
        minChildSize: 1,
        initialChildSize: 1,
        expand: true,
        builder: (context, _) {
          return Scaffold(
            body: Material(
              color: Colors.grey[900],
              child: Column(
                children: [
                  BottomSheetHeading(
                    title: "Chart Settings",
                    onAccept: () {
                      if (submissionError != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(submissionError!),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      Navigator.pop(context, chartSettings);
                    },
                  ),
                  Expanded(
                    child: ListView(
                      padding: kListViewPadding,
                      children: [
                        if (widget.hangboardChartType.shouldPromptForHoldSizes)
                          buildHoldSizeSelector(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildHoldSizeSelector() {
    final entries = context.bloc.state.filteredHangboardEntries
        .map((e) => e.data())
        .whereType<HangboardEntryModel>();

    final allWorkoutItems = entries.fold(
        <HangboardItemModel>[],
        (List<HangboardItemModel> items, entry) => [
              ...items,
              ...entry.hangboardRoutine.nonRestItems,
            ]);

    final checkBoxes = buildHoldSizeCheckBoxes(allWorkoutItems);

    if (checkBoxes.isEmpty) {
      return const ListTile(
        trailing: Icon(Icons.error_outline),
        title: Text("No data"),
        subtitle: Text(
          "This chart requires completed hangboard routines where a hold size was selected."
          " Once you create a routine where a hold size is selected, "
          "and log it as completed, options all appear here for you to select and chart.",
        ),
      );
    }

    return Column(
      children: [
        ListTile(
          title: const Text("Hold Sizes"),
          subtitle: Text(
            "Select up to ${settings.colors.length} hold sizes to plot.",
          ),
        ),
        ...buildHoldSizeCheckBoxes(allWorkoutItems),
      ],
    );
  }

  List<Widget> buildHoldSizeCheckBoxes(
    List<HangboardItemModel> allWorkoutItems,
  ) {
    return settings.measurementSystem.holdSizes
        .map(
          (holdSize) {
            final totalTimeHungOnSizeInSeconds = allWorkoutItems
                .where((item) => item.holdSize == holdSize)
                .map((e) => e.duration)
                .fold(0, (int i, e) => i + e.inSeconds);

            if (totalTimeHungOnSizeInSeconds == 0) {
              return null;
            }

            final time = formatMinutesAndSeconds(
                totalTimeHungOnSizeInSeconds ~/ 60,
                totalTimeHungOnSizeInSeconds % 60);

            return buildHoldSizeListTile(holdSize, time);
          },
        )
        .whereType<Widget>()
        .toList();
  }

  CheckboxListTile buildHoldSizeListTile(String holdSize, String time) {
    return CheckboxListTile(
      title: Text(holdSize),
      subtitle: Text("$time trained"),
      value: selectedHoldSizes.contains(holdSize),
      onChanged: (isChecked) {
        if (selectedHoldSizes.length == settings.colors.length) {
          setState(() {
            selectedHoldSizes.removeLast();
          });
        }

        if (isChecked != null) {
          setState(() {
            isChecked
                ? selectedHoldSizes.add(holdSize)
                : selectedHoldSizes.remove(holdSize);
          });
        }
      },
    );
  }
}
