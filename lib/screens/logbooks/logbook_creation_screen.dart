import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/confirm_back.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/user_input/ascent_type_radio.dart';
import 'package:climb_logger/components/user_input/attempts_selector.dart';
import 'package:climb_logger/components/user_input/date_select_list_tile.dart';
import 'package:climb_logger/components/user_input/grade_select.dart';
import 'package:climb_logger/components/user_input/tags_multi_select.dart';
import 'package:climb_logger/components/user_input/wall_type_radio.dart';
import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LogbookCreationScreen extends StatefulWidget {
  final LogbookEntryModel? initialData;

  const LogbookCreationScreen({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  @override
  State<LogbookCreationScreen> createState() => LogbookCreationScreenState();
}

class LogbookCreationScreenState extends State<LogbookCreationScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final nameController = TextEditingController();
  final detailsController = TextEditingController();

  late final String initialName;
  late final String initialDetails;

  bool get isEditing => widget.initialData != null;
  int? attempts;
  bool userHasChangedForm = false;

  late AscentType ascentType;
  late ClimbType climbType;
  late GradingSystem boulderGrades;
  late GradingSystem sportGrades;
  late String gradeLabel;
  late WallType wallType;

  List<String> tags = [];

  bool get shouldPromptForBack {
    return userHasChangedForm ||
        initialName != nameController.text ||
        initialDetails != detailsController.text;
  }

  DateTime get selectedDateAndTime => DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
        DateTime.now().second,
      );

  bool get isProject => ascentType == AscentType.project;

  @override
  void initState() {
    final settings = context.bloc.state.settings;
    ascentType = settings.ascentType;
    climbType = settings.climbType;
    boulderGrades = settings.boulderingGradingSystem;
    sportGrades = settings.sportGradingSystem;
    wallType = settings.wallType;
    setGradeLabelToFirstItem();

    final logbookEntry = widget.initialData;
    if (logbookEntry != null) {
      selectedDate = logbookEntry.dateTime;
      selectedTime =
          TimeOfDay(hour: selectedDate.hour, minute: selectedDate.minute);
      nameController.text = logbookEntry.climbName ?? "";
      detailsController.text = logbookEntry.details ?? "";
      ascentType = logbookEntry.ascentType;
      gradeLabel = logbookEntry.gradeLabel;
      climbType = logbookEntry.climbType;
      tags = logbookEntry.tags;
      wallType = logbookEntry.wallType;
      attempts = logbookEntry.attempts;
    }

    initialName = nameController.text;
    initialDetails = detailsController.text;

    super.initState();
  }

  String get appBarTitle {
    if (isEditing) {
      return "Edit ${widget.initialData!.gradeLabel} from ${widget.initialData!.formattedDate}";
    }

    return "Add $gradeLabel to Logbook";
  }

  void setGradeLabelToFirstItem() {
    switch (climbType) {
      case ClimbType.boulder:
        gradeLabel = boulderGrades.labels.first;
        break;
      case ClimbType.sport:
        gradeLabel = sportGrades.labels.first;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmBack(
      shouldPrompt: shouldPromptForBack,
      dialogTitle: isEditing ? "Discard Changes?" : "Discard Logbook Entry?",
      child: Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        appBar: AppBar(
          title: Text(appBarTitle),
          actions: [
            IconButton(
              onPressed: Navigator.of(context).settings,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: null,
          onPressed: onSubmit,
          label: const Text("Save"),
          icon: Icon(isEditing ? Icons.edit : Icons.save),
        ),
        body: ListView(
          padding: kListViewPadding,
          children: [
            if (!isProject)
              GradeSelect(
                key: const Key("GradeSelect"),
                selected: gradeLabel,
                climbType: climbType,
                ascentType: ascentType,
                onClimbTypeChanged: (c) => setState(() {
                  climbType = c;
                  userHasChangedForm = true;
                }),
                onGradeChanged: (g) => setState(() {
                  gradeLabel = g;
                  userHasChangedForm = true;
                }),
              ),
            if (!isProject) const Divider(),
            if (!isProject)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: AscentTypeRadio(
                      key: const Key("AscentTypeRadio"),
                      selectableOptions: completeAscentTypes,
                      ascentType: ascentType,
                      onChanged: (a) => setState(() {
                        ascentType = a;
                        userHasChangedForm = true;
                      }),
                    ),
                  ),
                  Container(
                    height: 220,
                    width: 1,
                    color: Theme.of(context).dividerTheme.color,
                  ),
                  Flexible(
                    flex: 1,
                    child: WallTypeRadio(
                      key: const Key("WallTypeRadio"),
                      wallType: wallType,
                      onChanged: (a) {
                        setState(() {
                          wallType = a;
                          userHasChangedForm = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            AttemptsSelector(
              key: const Key("AttemptsSelector"),
              attempts: attempts,
              ascentType: ascentType,
              onChanged: (selected) => setState(() {
                attempts = selected;
                userHasChangedForm = true;
              }),
            ),
            const Divider(),
            DateSelectListTile(
              key: const Key("DateSelectListTile"),
              subtitle: "Date",
              onSelected: (selected) => setState(() {
                selectedDate = selected;
                userHasChangedForm = true;
              }),
              selectedDate: selectedDate,
            ),
            ListTile(
              key: const Key("TimeSelectListTile"),
              title: Text(selectedTime.format(context)),
              subtitle: const Text("Time"),
              trailing: const Icon(Icons.timelapse),
              onTap: () async {
                final selected = await showTimePicker(
                  initialTime: selectedTime,
                  context: context,
                );

                if (selected != null) {
                  setState(() {
                    selectedTime = selected;
                    userHasChangedForm = true;
                  });
                }
              },
            ),
            if (!isProject) const Divider(),
            if (!isProject)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  key: const Key("ClimbNameEntry"),
                  textCapitalization: TextCapitalization.words,
                  autofocus: false,
                  decoration: const InputDecoration(
                    label: Text("Climb Name"),
                  ),
                  controller: nameController,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                key: const Key("DetailsEntry"),
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  label: Text("Additional details"),
                ),
                controller: detailsController,
              ),
            ),
            if (!isProject) const Divider(),
            if (!isProject)
              ListTile(
                key: const Key("TagsInfo"),
                contentPadding: const EdgeInsets.only(left: 16.0),
                title: const Text("Tags"),
                subtitle:
                    const Text("Tags can be used for filtering and charts."),
                trailing: TextButton(
                  child: const Text("VIEW"),
                  onPressed: Navigator.of(context).tags,
                ),
              ),
            if (!isProject)
              TagsMultiSelect(
                key: const Key("TagsMultiSelect"),
                selected: tags,
                onChanged: (selected) => setState(() {
                  tags = selected;
                  userHasChangedForm = true;
                }),
                ascentType: ascentType,
              ),
          ],
        ),
      ),
    );
  }

  void onSubmit() async {
    final model = LogbookEntryModel(
      selectedDateAndTime,
      detailsController.text.trim(),
      nameController.text.trim(),
      gradeLabel,
      climbType,
      ascentType,
      tags,
      wallType,
      ascentType.allowsAttempts ? attempts : null,
    );

    if (isEditing) {
      final goalsWhichNewAscentEffects = context.bloc.state.incompleteGoals
          .map((e) => e.data())
          .whereType<GoalModel>()
          .where((goal) => goal.objectives
              .where((obj) => obj.ascentSatisfiesObjective(model))
              .isNotEmpty)
          .toList();

      final goalsWhichInitialDataEffects = context.bloc.state.incompleteGoals
          .map((e) => e.data())
          .whereType<GoalModel>()
          .where((goal) => goal.objectives
              .where((obj) => obj.ascentSatisfiesObjective(widget.initialData!))
              .isNotEmpty)
          .toList();

      final shouldPrompt = !listEquals(
        goalsWhichNewAscentEffects,
        goalsWhichInitialDataEffects,
      );

      if (!shouldPrompt) {
        Navigator.pop(context, model);
        return;
      }

      final confirm = await showConfirmationDialog(
        context,
        title: "Modify this log?",
        message: "This will modify progress on your goals. Your goals "
            "will be automatically updated based on the new information.",
      );

      if (confirm) {
        Navigator.pop(context, model);
      }
    } else {
      Navigator.pop(context, model);
    }
  }
}
