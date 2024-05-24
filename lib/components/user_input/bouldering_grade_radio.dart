import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:flutter/material.dart';

import '../dialogs/confirm_dialog.dart';

class BoulderingGradeRadio extends StatelessWidget {
  final GradingSystem gradingSystem;
  final void Function(GradingSystem gradingSystem) onChanged;

  const BoulderingGradeRadio({
    Key? key,
    required this.gradingSystem,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...gradeMap.values
            .where(
                (gradingSystem) => gradingSystem.climbType == ClimbType.boulder)
            .map(
              (gradeType) => RadioListTile<GradingSystem>(
                title: Text(gradeType.label),
                value: gradeType,
                groupValue: gradingSystem,
                onChanged: (value) async {
                  final anyLogbookEntries =
                      context.bloc.state.logbookEntryDocList.isNotEmpty;
                  bool confirm = true;
                  if (anyLogbookEntries) {
                    confirm = await showConfirmationDialog(
                      context,
                      title: 'Change bouldering grades?',
                      message:
                          'Charts and goals only work with the grading system they were created in. '
                          'It is best to use only one'
                          ' grading system for bouldering and sport climbs at a time.',
                    );
                  }
                  if (value != null && confirm) {
                    onChanged(value);
                  }
                },
              ),
            ),
      ],
    );
  }
}
