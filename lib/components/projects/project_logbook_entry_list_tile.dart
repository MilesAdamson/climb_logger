import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectLogbookEntryListTile extends StatelessWidget {
  final DocumentSnapshot<LogbookEntryModel> document;

  bool get isCompleted => document.data()!.ascentType.isCompleteAscent;

  const ProjectLogbookEntryListTile({
    Key? key,
    required this.document,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logbookEntry = document.data()!;
    return Hero(
      tag: document.id,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListTile(
          trailing: isCompleted
              ? const Icon(Icons.check_box_outlined)
              : const SizedBox.shrink(),
          onTap: () {
            Navigator.of(context).logbookEntry(document.id);
          },
          title: Text(logbookEntry.formattedDateAndTime),
          subtitle: Text(logbookEntry.projectSubtitle),
          leading: GradeIcon(
            color: logbookEntry.ascentType.color(context),
            gradeLabel: logbookEntry.gradeLabel,
          ),
        ),
      ),
    );
  }
}
