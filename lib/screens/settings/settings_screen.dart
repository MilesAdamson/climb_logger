import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/choose_color_dialog.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/loading_bars.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/user_input/ascent_type_radio.dart';
import 'package:climb_logger/components/user_input/bouldering_grade_radio.dart';
import 'package:climb_logger/components/user_input/chart_y_axis_type_radio.dart';
import 'package:climb_logger/components/user_input/climb_type_radio.dart';
import 'package:climb_logger/components/user_input/exact_grades_radio.dart';
import 'package:climb_logger/components/user_input/measurement_system_radio.dart';
import 'package:climb_logger/components/user_input/sport_grade_radio.dart';
import 'package:climb_logger/components/user_input/wall_type_radio.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/app_color.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_y_axis_type.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Builder(builder: (context) {
          final settings = state.userDocument?.data()?.settingsModel;

          if (settings == null) {
            return const Center(child: LoadingBars());
          }

          return ListView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
            children: [
              const ListTile(
                title: Text("Measurement System"),
                subtitle: Text(
                  "Select which system you use for hangboard hold sizes.",
                ),
              ),
              MeasurementSystemRadio(
                measurementSystem: settings.measurementSystem,
                onChanged: (system) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(measurementSystem: system),
                    ),
                  );
                },
              ),
              const Divider(),
              const ListTile(
                title: Text("Exact grades for goals"),
                subtitle: Text(
                    "Select whether exact grades for goals in selected by default."),
              ),
              ExactGradesRadio(
                exactGradesOnly: settings.exactGradesOnly,
                onChanged: (bool selected) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(exactGradesOnly: selected),
                    ),
                  );
                },
              ),
              const Divider(),
              const ListTile(
                title: Text("Climb Type"),
                subtitle: Text(
                    "Select which type of climb you will log most often. It will be the default selection."),
              ),
              ClimbTypeRadio(
                climbType: settings.climbType,
                onChanged: (type) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(climbType: type),
                    ),
                  );
                },
              ),
              const Divider(),
              const ListTile(
                title: Text("Ascent Type"),
                subtitle: Text(
                    "Select which type of ascent you will log most often. It will be the default selection."),
              ),
              AscentTypeRadio(
                selectableOptions: completeAscentTypes,
                ascentType: settings.ascentType,
                onChanged: (type) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(ascentType: type),
                    ),
                  );
                },
              ),
              const Divider(),
              const ListTile(
                title: Text("Wall Type"),
                subtitle: Text(
                    "Select which angle of wall you will log most often. It will be the default selection."),
              ),
              WallTypeRadio(
                wallType: settings.wallType,
                onChanged: (type) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(wallType: type),
                    ),
                  );
                },
              ),
              const Divider(),
              const ListTile(
                title: Text("Chart Type"),
                subtitle:
                    Text("When prompted to enter the settings for a chart,"
                        " this will be the default value for the y-axis units"),
              ),
              ChartYAxisTypeRadio(
                selectable: ChartYAxisType.values,
                chartYAxisType: settings.chartYAxisType,
                onChanged: (value) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(chartYAxisType: value),
                    ),
                  );
                },
              ),
              const Divider(),
              const ListTile(
                title: Text("Bouldering Grades"),
                subtitle: Text(
                    "Select which type of bouldering grade you prefer. "
                    "Charts work best if you use only one boulder grading system."),
              ),
              BoulderingGradeRadio(
                onChanged: (value) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(boulderingSystemKey: value.systemKey),
                    ),
                  );
                },
                gradingSystem: settings.boulderingGradingSystem,
              ),
              const Divider(),
              const ListTile(
                title: Text("Sport Grades"),
                subtitle: Text("Select which type of sport grade you prefer. "
                    "Charts work best if you use only one sport grading system."),
              ),
              SportGradeRadio(
                onChanged: (value) {
                  context.bloc.add(
                    ChangeSettingsEvent(
                      settings.copyWith(sportSystemKey: value.systemKey),
                    ),
                  );
                },
                gradingSystem: settings.sportGradingSystem,
              ),
              const Divider(),
              ListTile(
                title: const Text("Color One"),
                subtitle: const Text("Change the color of redpoints and slabs"),
                trailing: CircleAvatar(
                  foregroundColor: settings.colorOne,
                  backgroundColor: settings.colorOne,
                  maxRadius: 10.0,
                ),
                onTap: () async {
                  final color = await showColorPicker(
                    context,
                    initialValue: state.settings.colorOne,
                    resetValue: AppColor.colorOneDefaultValue,
                  );

                  if (color != null) {
                    context.bloc.add(ChangeSettingsEvent(
                      settings.copyWith(colorOneValue: color.value),
                    ));
                  }
                },
              ),
              ListTile(
                title: const Text("Color Two"),
                subtitle:
                    const Text("Change the color of flashes and vert walls"),
                trailing: CircleAvatar(
                  foregroundColor: settings.colorTwo,
                  backgroundColor: settings.colorTwo,
                  maxRadius: 10.0,
                ),
                onTap: () async {
                  final color = await showColorPicker(
                    context,
                    initialValue: state.settings.colorTwo,
                    resetValue: AppColor.colorTwoDefaultValue,
                  );

                  if (color != null) {
                    context.bloc.add(ChangeSettingsEvent(
                      settings.copyWith(colorTwoValue: color.value),
                    ));
                  }
                },
              ),
              ListTile(
                title: const Text("Color Three"),
                subtitle:
                    const Text("Change the color of onsights and overhangs"),
                trailing: CircleAvatar(
                  foregroundColor: settings.colorThree,
                  backgroundColor: settings.colorThree,
                  maxRadius: 10.0,
                ),
                onTap: () async {
                  final color = await showColorPicker(
                    context,
                    initialValue: state.settings.colorThree,
                    resetValue: AppColor.colorThreeDefaultValue,
                  );

                  if (color != null) {
                    context.bloc.add(ChangeSettingsEvent(
                      settings.copyWith(colorThreeValue: color.value),
                    ));
                  }
                },
              ),
              ListTile(
                title: const Text("Color Four"),
                subtitle:
                    const Text("Change the color of projects and roof climbs"),
                trailing: CircleAvatar(
                  foregroundColor: settings.colorFour,
                  backgroundColor: settings.colorFour,
                  maxRadius: 10.0,
                ),
                onTap: () async {
                  final color = await showColorPicker(
                    context,
                    initialValue: state.settings.colorFour,
                    resetValue: AppColor.colorFourDefaultValue,
                  );

                  if (color != null) {
                    context.bloc.add(ChangeSettingsEvent(
                      settings.copyWith(colorFourValue: color.value),
                    ));
                  }
                },
              ),
              ListTile(
                title: const Text("Color Five"),
                subtitle: const Text("Change the color of hangboard routines"),
                trailing: CircleAvatar(
                  foregroundColor: settings.colorFive,
                  backgroundColor: settings.colorFive,
                  maxRadius: 10.0,
                ),
                onTap: () async {
                  final color = await showColorPicker(
                    context,
                    initialValue: state.settings.colorFive,
                    resetValue: AppColor.colorFiveDefaultValue,
                  );

                  if (color != null) {
                    context.bloc.add(ChangeSettingsEvent(
                      settings.copyWith(colorFiveValue: color.value),
                    ));
                  }
                },
              ),
              ListTile(
                title: const Text("Color Six"),
                subtitle: const Text("Change the color of some plots"),
                trailing: CircleAvatar(
                  foregroundColor: settings.colorSix,
                  backgroundColor: settings.colorSix,
                  maxRadius: 10.0,
                ),
                onTap: () async {
                  final color = await showColorPicker(
                    context,
                    initialValue: state.settings.colorSix,
                    resetValue: AppColor.colorSixDefaultValue,
                  );

                  if (color != null) {
                    context.bloc.add(ChangeSettingsEvent(
                      settings.copyWith(colorSixValue: color.value),
                    ));
                  }
                },
              ),
              const Divider(),
              ListTile(
                subtitle: const Text(
                  "If you believe the app is not reflecting any purchases"
                  " you have made (such as removing ads), you can try restoring purchases.",
                ),
                title: const Text("Restore Purchases"),
                onTap: () async {
                  final confirm = await showConfirmationDialog(
                    context,
                    title: "Restore Purchases",
                  );

                  if (confirm) {
                    context.iapService.restorePurchases();
                  }
                },
              ),
            ],
          );
        }),
      );
    });
  }
}
