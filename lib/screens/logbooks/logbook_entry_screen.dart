import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/logbook/logbook_entry_list_tile.dart';
import 'package:climb_logger/components/logbook/tags_display.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class LogbookEntryScreen extends StatefulWidget {
  final String logbookEntryId;

  const LogbookEntryScreen({
    Key? key,
    required this.logbookEntryId,
  }) : super(key: key);

  @override
  State<LogbookEntryScreen> createState() => LogbookEntryScreenState();
}

class LogbookEntryScreenState extends State<LogbookEntryScreen> {
  String cloneMessage(LogbookEntryModel logbookEntry) {
    return "${logbookEntry.gradeLabel} ${logbookEntry.ascentType.name} for ${DateTime.now().formattedDate}";
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final document = state.logbookEntryMap[widget.logbookEntryId];

      DocumentSnapshot<ProjectModel>? parent = state.sortedProjectDocuments
          .firstWhereOrNull((p) =>
              p.data()!.relatedLogbookEntryIds.contains(widget.logbookEntryId));

      final logbookEntry = document?.data();

      if (document == null || logbookEntry == null) {
        return Scaffold(
          bottomNavigationBar: const BottomBannerAd(),
          appBar: AppBar(
            title: const Text("Logbook Entry"),
          ),
        );
      }

      return Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        appBar: AppBar(
          title: const Text("Logbook Entry"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: [
            LogbookEntryListTile(document: document),
            if (parent != null)
              ListTile(
                title: const Text("Project"),
                subtitle: Text('This logbook entry is part of your project '
                    '"${parent.data()!.name}"'),
              ),
            ListTile(
              title: Text(logbookEntry.formattedDateAndTime),
              subtitle: const Text("Date"),
            ),
            if (logbookEntry.attempts != null)
              ListTile(
                title: Text("${logbookEntry.attempts} Attempts"),
              ),
            ListTile(
              title: Text(logbookEntry.wallType.label),
              subtitle: const Text("Wall Type"),
            ),
            TagsDisplay(
              tags: logbookEntry.tags,
              ascentType: logbookEntry.ascentType,
            ),
            const Divider(),
            buildEditButton(context, logbookEntry, document),
            if (logbookEntry.ascentType != AscentType.project)
              buildCloneButton(context, logbookEntry),
            ListTile(
              title: const Text("Delete"),
              subtitle: const Text("Permanently deletes this logbook entry"),
              trailing: const Icon(Icons.delete),
              onTap: () async {
                final confirm = await showConfirmationDialog(context,
                    title: "Delete this ${logbookEntry.gradeLabel}?",
                    message:
                        "Your progress towards ongoing goals could be changed. "
                        "Completed goals will be unaffected.");
                if (confirm) {
                  Navigator.of(context).pop();
                  context.bloc.add(DeleteLogbookEntryEvent(document.id));
                }
              },
            ),
          ],
        ),
      );
    });
  }

  ListTile buildCloneButton(
      BuildContext context, LogbookEntryModel logbookEntry) {
    return ListTile(
      title: const Text("Clone"),
      subtitle: const Text(
          "Saves a copy of this logbook entry with the current date and time"),
      trailing: const Icon(Icons.copy),
      onTap: () async {
        final confirm = await showConfirmationDialog(context,
            title: "Clone this ${logbookEntry.gradeLabel}?",
            message:
                "This will create a new ${cloneMessage(logbookEntry)}. Goals will be updated accordingly.");
        if (confirm) {
          final copy = logbookEntry.copyWith(dateTime: DateTime.now());
          context.bloc.add(CreateLogbookEntryEvent(copy));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Created a ${cloneMessage(logbookEntry)}"),
            ),
          );
        }
      },
    );
  }

  ListTile buildEditButton(
    BuildContext context,
    LogbookEntryModel logbookEntry,
    DocumentSnapshot<LogbookEntryModel> document,
  ) {
    return ListTile(
      title: const Text("Edit"),
      subtitle: Text(logbookEntry.ascentType == AscentType.project
          ? "Only certain fields can be edited for project entries. "
              "If you wish to change core information like the grade, "
              "edit the project instead."
          : "Change any property of this logbook entry"),
      trailing: const Icon(Icons.edit),
      onTap: () async {
        final edited = await Navigator.of(context)
            .logbookCreation(initialData: logbookEntry);

        if (edited != null) {
          context.bloc.add(EditLogbookEntryEvent(document.id, edited));
        }
      },
    );
  }
}
