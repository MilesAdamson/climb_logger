import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/components/user_input/ascent_type_radio.dart';
import 'package:climb_logger/components/user_input/exact_grades_radio.dart';
import 'package:climb_logger/components/user_input/grade_select.dart';
import 'package:climb_logger/components/user_input/tag_select.dart';
import 'package:climb_logger/models/objective_model.dart';
import 'package:climb_logger/models/settings_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:flutter/material.dart';

class ObjectiveCreationBottomSheet extends StatefulWidget {
  const ObjectiveCreationBottomSheet({Key? key}) : super(key: key);

  @override
  State<ObjectiveCreationBottomSheet> createState() =>
      ObjectiveCreationBottomSheetState();
}

class ObjectiveCreationBottomSheetState
    extends State<ObjectiveCreationBottomSheet> {
  late AscentType ascentType;
  late ClimbType climbType;
  late String gradeLabel;
  late GradingSystem sportGrades;
  late GradingSystem boulderingGrades;
  late bool exactGradesOnly;
  String? tag;

  int targetCount = 1;

  ObjectiveModel get objective => ObjectiveModel(
        targetCount,
        0,
        climbType,
        ascentType,
        gradeLabel,
        exactGradesOnly,
        tag,
      );

  @override
  void initState() {
    final settings = context.bloc.state.userDocument?.data()?.settingsModel ??
        SettingsModel.defaultValues();

    ascentType = settings.ascentType;
    climbType = settings.climbType;
    sportGrades = settings.sportGradingSystem;
    boulderingGrades = settings.boulderingGradingSystem;
    exactGradesOnly = settings.exactGradesOnly;
    setGradeLabelToFirstItem();
    super.initState();
  }

  void setGradeLabelToFirstItem() {
    switch (climbType) {
      case ClimbType.boulder:
        gradeLabel = boulderingGrades.labels.first;
        break;
      case ClimbType.sport:
        gradeLabel = sportGrades.labels.first;
        break;
    }
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
        builder: (context, controller) {
          return Material(
            color: Colors.grey[900],
            child: Column(
              children: [
                BottomSheetHeading(
                  title: objective.title,
                  onAccept: () =>
                      Navigator.pop<ObjectiveModel>(context, objective),
                ),
                Expanded(
                  child: ListView(
                    padding: kListViewPadding,
                    children: [
                      GradeSelect(
                        selected: gradeLabel,
                        onGradeChanged: (g) => setState(() => gradeLabel = g),
                        climbType: climbType,
                        ascentType: ascentType,
                        onClimbTypeChanged: (c) =>
                            setState(() => climbType = c),
                      ),
                      const Divider(),
                      ExactGradesRadio(
                        exactGradesOnly: exactGradesOnly,
                        onChanged: (bool selected) =>
                            setState(() => exactGradesOnly = selected),
                      ),
                      const Divider(),
                      AscentTypeRadio(
                        selectableOptions: completeAscentTypes,
                        ascentType: ascentType,
                        onChanged: (value) {
                          setState(() => ascentType = value);
                        },
                      ),
                      buildCountSelect(),
                      const Divider(),
                      const ListTile(
                        title: Text("Tag"),
                        subtitle:
                            Text("You can restrict this objective to a tag. "
                                "Only an ascent which has the tag will count."),
                      ),
                      TagSelect(
                        selected: tag,
                        onChanged: (selected) {
                          setState(() {
                            tag = selected;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ListTile buildCountSelect() {
    return ListTile(
      title: Text("Number of ${ascentType.pluralLabel}"),
      trailing: DropdownButton<int>(
        value: targetCount,
        items: List.generate(
          20,
          (i) => DropdownMenuItem<int>(
            value: i + 1,
            child: Text("${i + 1}"),
          ),
        ),
        onChanged: (i) {
          if (i != null) {
            setState(() => targetCount = i);
          }
        },
      ),
    );
  }
}
