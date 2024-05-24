import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/components/user_input/chart_y_axis_type_radio.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:flutter/material.dart';

Future<ChartSettingsModel?> showChartSettingsBottomSheet(
  BuildContext context,
  ChartType chartType,
) async {
  return showModalBottomSheet<ChartSettingsModel>(
    isDismissible: true,
    isScrollControlled: true,
    clipBehavior: Clip.antiAlias,
    shape: BottomSheetHeading.sheetShape,
    context: context,
    builder: (context) => ChartSettingsBottomSheet(chartType: chartType),
  );
}

class ChartSettingsBottomSheet extends StatefulWidget {
  final ChartType chartType;

  const ChartSettingsBottomSheet({
    Key? key,
    required this.chartType,
  }) : super(key: key);

  @override
  State<ChartSettingsBottomSheet> createState() =>
      ChartSettingsBottomSheetState();
}

class ChartSettingsBottomSheetState extends State<ChartSettingsBottomSheet> {
  late ChartYAxisType chartYAxisType;
  bool showRedpoints = true;
  bool showFlashes = true;
  bool showOnsights = true;
  bool showProjects = true;

  GradingSystem? get gradingSystem {
    switch (chartYAxisType) {
      case ChartYAxisType.bouldering:
        return context.bloc.state.settings.boulderingGradingSystem;
      case ChartYAxisType.sport:
        return context.bloc.state.settings.sportGradingSystem;
      case ChartYAxisType.score:
        return null;
    }
  }

  List<ChartYAxisType> get yAxisTypes => widget.chartType.availableYAxisTypes;

  bool get showYAxisSelector => yAxisTypes.length >= 2;

  ChartSettingsModel get chartSettings => ChartSettingsModel(
        showRedpoints,
        showFlashes,
        showOnsights,
        showProjects,
        chartYAxisType,
        gradingSystem,
      );

  String? get submissionError {
    bool showAnything =
        showRedpoints || showFlashes || showOnsights || showProjects;
    if (!showAnything) {
      return "You must select at least one of redpoints, flashes, onsights and projects";
    }

    final filtered = chartSettings
        .filterEntries(context.bloc.state.logbookEntryMap.mapToData());

    if (filtered.isEmpty) {
      return "These settings do not match any logbook entries";
    }

    // no error
    return null;
  }

  @override
  initState() {
    final settings = context.bloc.state.settings;

    if (yAxisTypes.contains(settings.chartYAxisType)) {
      chartYAxisType = settings.chartYAxisType;
    } else {
      chartYAxisType = yAxisTypes.first;
    }
    super.initState();
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
                        if (showYAxisSelector)
                          const ListTile(
                            title: Text("Y-Axis Type"),
                          ),
                        if (showYAxisSelector)
                          ChartYAxisTypeRadio(
                            selectable: widget.chartType.availableYAxisTypes,
                            chartYAxisType: chartYAxisType,
                            onChanged: (c) =>
                                setState(() => chartYAxisType = c),
                          ),
                        const Divider(),
                        CheckboxListTile(
                          value: showRedpoints,
                          title: const Text("Show redpoints"),
                          onChanged: (c) =>
                              setState(() => showRedpoints = c ?? false),
                        ),
                        CheckboxListTile(
                          value: showFlashes,
                          title: const Text("Show flashes"),
                          onChanged: (c) =>
                              setState(() => showFlashes = c ?? false),
                        ),
                        CheckboxListTile(
                          value: showOnsights,
                          title: const Text("Show onsights"),
                          onChanged: (c) =>
                              setState(() => showOnsights = c ?? false),
                        ),
                        CheckboxListTile(
                          value: showProjects,
                          title: const Text("Show projects"),
                          onChanged: (c) =>
                              setState(() => showProjects = c ?? false),
                        ),
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
}
