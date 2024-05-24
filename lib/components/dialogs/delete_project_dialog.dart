import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';

enum DeleteProjectOption { projectOnly, projectAndEntries }

Future<DeleteProjectOption?> showDeleteProjectDialog(
  BuildContext context,
  ProjectViewModel viewModel,
) async {
  final result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Delete ${viewModel.project.name}?"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "You can delete this project, "
              "or delete it and ALL of its related logbook entries. "
              "Neither operation can be un-done.",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context, DeleteProjectOption.projectAndEntries);
                },
                child: Text(
                  "DELETE PROJECT AND ${viewModel.relatedEntryDocuments.length}"
                  " RELATED LOGBOOK ENTRIES",
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("CANCEL"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, DeleteProjectOption.projectOnly);
            },
            child: const Text("DELETE PROJECT ONLY"),
          ),
        ],
      );
    },
  );

  return result;
}
