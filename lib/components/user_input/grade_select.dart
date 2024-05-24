import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/user_input/climb_type_radio.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:flutter/material.dart';

class GradeSelect extends StatelessWidget {
  final String selected;
  final ClimbType climbType;
  final void Function(String gradeLabel) onGradeChanged;
  final void Function(ClimbType climbType) onClimbTypeChanged;
  final AscentType ascentType;

  const GradeSelect({
    Key? key,
    required this.selected,
    required this.onGradeChanged,
    required this.onClimbTypeChanged,
    required this.climbType,
    required this.ascentType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      late List<String> gradeLabels;
      final settings = state.settings;
      final boulderingGrades = settings.boulderingGradingSystem;
      final sportGrades = settings.sportGradingSystem;

      switch (climbType) {
        case ClimbType.boulder:
          gradeLabels = boulderingGrades.labels;
          break;
        case ClimbType.sport:
          gradeLabels = sportGrades.labels;
          break;
      }

      return Column(
        children: [
          ClimbTypeRadio(
            hasPluralLabels: false,
            climbType: climbType,
            onChanged: (value) {
              if (value != climbType) {
                onClimbTypeChanged(value);
                onGradeChanged(value == ClimbType.boulder
                    ? boulderingGrades.labels.first
                    : sportGrades.labels.first);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Wrap(alignment: WrapAlignment.start, children: [
                ...gradeLabels.map(
                  (label) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GradeIcon(
                      gradeLabel: label,
                      color: selected == label
                          ? ascentType.color(context)
                          : Colors.white,
                      onPressed: () => onGradeChanged(label),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      );
    });
  }
}
