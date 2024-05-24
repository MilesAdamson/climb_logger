import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/goals/goal_card.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/objective_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GoalScreen extends StatelessWidget {
  final String goalId;

  const GoalScreen({Key? key, required this.goalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const BottomBannerAd(),
          appBar: AppBar(
            title: const Text("Goal"),
          ),
          body: Builder(
            builder: (context) {
              final goalDocument = state.goalMap[goalId];
              final goal = goalDocument?.data();

              if (goalDocument == null || goal == null) {
                return const SizedBox.shrink();
              }

              return ListView(
                padding: kListViewPadding,
                children: [
                  GoalCard(document: goalDocument),
                  ListTile(
                    title: const Text("Edit"),
                    subtitle: const Text("Change any property of this goal"),
                    trailing: const Icon(Icons.edit),
                    onTap: () async {
                      final edited = await Navigator.of(context)
                          .goalCreation(initialData: goal);

                      if (edited != null) {
                        context.bloc.add(EditGoalEvent(goalId, edited));
                      }
                    },
                  ),
                  ListTile(
                    title: const Text("Delete"),
                    subtitle: const Text("Permanently deletes this goal."),
                    trailing: const Icon(Icons.delete),
                    onTap: () async {
                      final confirm = await showConfirmationDialog(
                        context,
                        message: "This is permanent.",
                        title: "Delete goal?",
                      );

                      if (confirm) {
                        Navigator.pop(context);
                        context.bloc.add(DeleteGoalEvent(goalDocument.id));
                      }
                    },
                  ),
                  const Divider(),
                  if (goal.isCompleted) ...[
                    const ListTile(
                      title: Text("Objectives"),
                      subtitle: Text(
                          "You have completed this goal! It is now read-only. Creating or "
                          "deleting logbook entries will not effect this goal anymore."),
                    ),
                  ] else ...[
                    const ListTile(
                      title: Text("Objectives"),
                      subtitle: Text(
                          "You can manually change the progress of any objective with the controls below."),
                    ),
                    ...goal.objectives.map(
                      (objective) => buildObjective(
                        objective,
                        goal,
                        context,
                        goalDocument,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        );
      },
    );
  }

  ListTile buildObjective(
    ObjectiveModel objective,
    GoalModel goal,
    BuildContext context,
    DocumentSnapshot<GoalModel> goalDocument,
  ) {
    VoidCallback? onMinus;
    if (objective.countCompleted <= objective.targetCount &&
        objective.countCompleted != 0) {
      onMinus = () {
        final edited = goal.modifyObjectiveCompletion(objective, -1);
        context.bloc.add(EditGoalEvent(goalDocument.id, edited));
      };
    }

    VoidCallback? onPlus;
    if (objective.countCompleted < objective.targetCount) {
      onPlus = () {
        final edited = goal.modifyObjectiveCompletion(objective, 1);
        context.bloc.add(EditGoalEvent(goalDocument.id, edited));
      };
    }

    return buildObjectiveListTile(
      objective,
      onMinus,
      onPlus,
    );
  }

  ListTile buildObjectiveListTile(
    ObjectiveModel objective,
    VoidCallback? onMinus,
    VoidCallback? onPlus,
  ) {
    return ListTile(
      title: Text(objective.title),
      subtitle: Text(
          "${objective.countCompleted} / ${objective.targetCount} ${objective.exactGradesOnly ? "" : "or harder"}"),
      trailing: IntrinsicWidth(
        child: Row(
          children: [
            IconButton(
              onPressed: onMinus,
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: onPlus,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
