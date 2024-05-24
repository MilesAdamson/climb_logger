import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogbookEntryListTile extends StatelessWidget {
  final DocumentSnapshot<LogbookEntryModel> document;
  final VoidCallback? onPressed;

  const LogbookEntryListTile({
    Key? key,
    required this.document,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logbookEntry = document.data();

    if (logbookEntry == null) {
      return const SizedBox.shrink();
    }

    return Hero(
      tag: document.id,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListTile(
          trailing: logbookEntry.score > 0
              ? Text(logbookEntry.score.toString())
              : null,
          onTap: onPressed,
          title: Text(logbookEntry.title),
          subtitle: Text(logbookEntry.subtitle),
          leading: GradeIcon(
            color: logbookEntry.ascentType.color(context),
            gradeLabel: logbookEntry.gradeLabel,
          ),
        ),
      ),
    );
  }
}
