import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/user_input/ascent_type_radio.dart';
import 'package:climb_logger/components/user_input/attempts_selector.dart';
import 'package:climb_logger/components/user_input/date_select_list_tile.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:flutter/material.dart';

class LogbookForProjectArgs {
  final ProjectModel project;
  final LogbookEntryModel? initialData;
  final AscentType initialAscentType;

  LogbookForProjectArgs(
    this.project,
    this.initialData,
    this.initialAscentType,
  );
}

class CreateLogbookForProjectScreen extends StatefulWidget {
  final LogbookForProjectArgs args;

  const CreateLogbookForProjectScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CreateLogbookForProjectScreenState();
}

class CreateLogbookForProjectScreenState
    extends State<CreateLogbookForProjectScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  late final detailsController = TextEditingController();

  int attempts = 1;
  bool userHasChangedForm = false;
  late AscentType ascentType = widget.args.initialAscentType;

  bool get isEditing => widget.args.initialData != null;
  ProjectModel get project => widget.args.project;
  bool get allowFlashAndOnsight =>
      project.relatedLogbookEntryIds.isEmpty && attempts == 1;

  @override
  void initState() {
    final entry = widget.args.initialData;

    if (entry != null) {
      ascentType = entry.ascentType;
      selectedDate = entry.dateTime;
      selectedTime = TimeOfDay(
        hour: selectedDate.hour,
        minute: selectedDate.minute,
      );
      detailsController.text = entry.details ?? "";
      attempts = entry.attempts ?? 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () async {
          final entry = LogbookEntryModel(
            DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedTime.hour,
              selectedTime.minute,
              DateTime.now().second,
            ),
            detailsController.text.trim(),
            project.name,
            project.gradeLabel,
            project.climbType,
            ascentType,
            project.tags,
            project.wallType,
            attempts,
          );

          bool confirm = true;
          if (ascentType.isCompleteAscent) {
            confirm = await showConfirmationDialog(
              context,
              title: "Complete ${project.name}?",
              message: "Logging a ${ascentType.label.toLowerCase()} will "
                  "complete your project",
            );
          }

          if (confirm) {
            Navigator.pop(context, entry);
          }
        },
        label: const Text("Save"),
        icon: Icon(isEditing ? Icons.edit : Icons.save),
      ),
      appBar: AppBar(
        title: Text("Log for ${project.name}"),
      ),
      body: ListView(
        padding: kListViewPadding,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text("Logbook Entry for Project"),
              subtitle: Text(
                'You are creating a logbook entry '
                'for your project, ${project.name}. The grade, '
                'tags and wall type are carried over from the projects settings.',
              ),
            ),
          ),
          const Divider(),
          AscentTypeRadio(
            selectableOptions: allowFlashAndOnsight
                ? AscentType.values
                : [AscentType.redpoint, AscentType.project],
            ascentType: ascentType,
            onChanged: (a) {
              setState(() => ascentType = a);
            },
          ),
          AttemptsSelector(
            attempts: attempts,
            ascentType: ascentType,
            onChanged: (selected) => setState(() {
              attempts = selected;
              userHasChangedForm = true;
            }),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                label: Text("Additional details"),
              ),
              controller: detailsController,
            ),
          ),
          DateSelectListTile(
            subtitle: "Date",
            onSelected: (selected) => setState(() {
              selectedDate = selected;
              userHasChangedForm = true;
            }),
            selectedDate: selectedDate,
          ),
          ListTile(
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
        ],
      ),
    );
  }
}
