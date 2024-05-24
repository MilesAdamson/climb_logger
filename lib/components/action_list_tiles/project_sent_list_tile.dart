import 'package:climb_logger/components/dialogs/select_project_dialog.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';

class ProjectSentListTile extends StatelessWidget {
  final List<ProjectViewModel> incompleteProjects;

  const ProjectSentListTile({
    Key? key,
    required this.incompleteProjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check),
      title: const Text("Sent a Project"),
      subtitle: const Text(
        "Mark a project as complete with a redpoint",
      ),
      onTap: () async {
        final selected = await selectProjectDialog(
          context,
          incompleteProjects,
          showOnlyIncomplete: true,
        );

        if (selected != null) {
          final logbookEntry =
              await Navigator.of(context).logbookCreationForProject(
            selected.project,
            AscentType.redpoint,
          );

          if (logbookEntry != null) {
            Navigator.pop(context);
            context.bloc.add(AddLogbookToProjectEvent(
              logbookEntry,
              selected.projectDocument.id,
            ));
          }
        }
      },
    );
  }
}
