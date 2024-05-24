import 'package:climb_logger/components/goals/objective_list_tile.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  final DocumentSnapshot<GoalModel> document;
  final VoidCallback? onPressed;

  const GoalCard({
    Key? key,
    required this.document,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goal = document.data();

    if (goal == null) {
      return const SizedBox.shrink();
    }

    return Hero(
      tag: document.id,
      child: Opacity(
        opacity: goal.isCompleted ? kCompletedItemOpacity : 1.0,
        child: Padding(
          padding: kCardOutsidePadding,
          child: Card(
            child: InkWell(
              onTap: onPressed,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Complete by ${goal.endDateGoal.formattedDate}",
                      style: TextStyle(
                        decoration: goal.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Text(
                        "Created on ${goal.createdAt.formattedDateAndTime}"),
                    trailing: goal.isCompleted
                        ? const Icon(Icons.check_box_outlined)
                        : const Icon(Icons.check_box_outline_blank),
                  ),
                  ...goal.objectives.map(
                    (objective) => ObjectiveListTile(objective: objective),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
