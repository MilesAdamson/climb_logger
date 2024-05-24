import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/bottom_sheets/bottom_sheet_heading.dart';
import 'package:climb_logger/components/bottom_sheets/objective_creation_bottom_sheet.dart';
import 'package:climb_logger/components/confirm_back.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/user_input/date_select_list_tile.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/objective_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GoalCreationScreen extends StatefulWidget {
  final GoalModel? initialData;

  const GoalCreationScreen({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  @override
  State<GoalCreationScreen> createState() => GoalCreationScreenState();
}

class GoalCreationScreenState extends State<GoalCreationScreen> {
  DateTime endDateGoal = DateTime.now().add(const Duration(days: 30));
  List<ObjectiveModel> objectives = [];
  final listKey = GlobalKey<AnimatedListState>();

  bool get isEditing => widget.initialData != null;

  late final List<ObjectiveModel> initialObjectives;
  late final DateTime initialDate;

  bool get shouldPromptOnBack {
    return initialDate != endDateGoal ||
        !listEquals(initialObjectives, objectives);
  }

  @override
  void initState() {
    final data = widget.initialData;
    if (data != null) {
      endDateGoal = data.endDateGoal;
      objectives = List.of(data.objectives);
    }

    initialDate = endDateGoal;
    initialObjectives = List.of(objectives);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmBack(
      shouldPrompt: shouldPromptOnBack,
      dialogTitle: isEditing ? "Discard Changes?" : "Discard Goal?",
      child: Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        floatingActionButton: buildFloatingActionButtons(context),
        appBar: AppBar(
          title: Text(isEditing ? "Edit Goal" : "Create Goal"),
          actions: [
            IconButton(
              onPressed: Navigator.of(context).settings,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Column(
          children: [
            DateSelectListTile(
              subtitle: "Target completion date",
              onSelected: (selected) => setState(() => endDateGoal = selected),
              selectedDate: endDateGoal,
            ),
            const Divider(height: 1),
            if (objectives.isEmpty)
              Padding(
                padding:
                    const EdgeInsets.only(top: 64.0, left: 16.0, right: 16.0),
                child: Text(
                  "Tap \"Add\" to create objectives here.\n\nGoals have a list of objectives. "
                  "Objectives have a grade and climb type. For example, \"Redpoint a 5.12a\"",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!,
                ),
              ),
            Expanded(
              child: AnimatedList(
                key: listKey,
                padding: kListViewPadding,
                initialItemCount: objectives.length,
                itemBuilder: (context, i, animation) =>
                    buildObjectiveListTile(objectives[i], animation, true),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloatingActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (objectives.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                Navigator.pop(
                  context,
                  GoalModel(
                    objectives,
                    endDateGoal,
                    widget.initialData?.createdAt ?? DateTime.now(),
                  ),
                );
              },
              label: const Text("Save"),
              icon: const Icon(Icons.save),
            ),
          ),
        FloatingActionButton.extended(
          heroTag: null,
          onPressed: () async {
            final obj = await showModalBottomSheet<ObjectiveModel?>(
              isDismissible: true,
              isScrollControlled: true,
              clipBehavior: Clip.antiAlias,
              shape: BottomSheetHeading.sheetShape,
              context: context,
              builder: (context) => const ObjectiveCreationBottomSheet(),
            );

            if (obj != null) {
              listKey.currentState!.insertItem(objectives.length);
              setState(() {
                objectives.add(obj);
              });
            }
          },
          label: const Text("Add"),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget buildObjectiveListTile(
    ObjectiveModel objective,
    Animation<double> animation,
    bool enabled,
  ) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        key: UniqueKey(),
        title: Text(objective.title),
        subtitle: objective.subtitle != null ? Text(objective.subtitle!) : null,
        leading: GradeIcon(
          gradeLabel: objective.gradeLabel,
          color: objective.ascentType.color(context),
        ),
        contentPadding: const EdgeInsets.only(left: 16.0, right: 2.0),
        trailing: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.delete),
          onPressed: enabled
              ? () async {
                  bool confirm = false;
                  if (objective.countCompleted != 0) {
                    confirm = await showConfirmationDialog(
                      context,
                      message:
                          "This objective is already ${objective.progressLabel} completed. "
                          "If you delete it, that progress will be lost. "
                          "\n\nYou can manually edit your progress on any goal at any time.",
                      title: "Delete objective?",
                    );
                  }

                  if (objective.countCompleted == 0 || confirm) {
                    listKey.currentState!.removeItem(
                        objectives.indexOf(objective),
                        (context, animation) => buildObjectiveListTile(
                            objective, animation, false));

                    setState(() => objectives.remove(objective));
                  }
                }
              : null,
        ),
      ),
    );
  }
}
