import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:flutter/material.dart';

Future<GradingSystem?> showGradingSystemDialog(
  BuildContext context, {
  List<LogbookEntryModel>? logbookEntries,
}) async {
  final systems =
      (logbookEntries ?? context.bloc.state.logbookEntryMap.mapToData())
          .map((logbookEntry) => logbookEntry.gradingSystem)
          .toSet();

  if (systems.length == 1) {
    return systems.single;
  }

  final result = await showDialog<GradingSystem>(
    context: context,
    builder: (context) => const GradingSystemDialog(),
  );

  return result;
}

class GradingSystemDialog extends StatelessWidget {
  const GradingSystemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Sport or bouldering?"),
      content: const Text("Select one to be plotted."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("CANCEL"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
                context, context.bloc.state.settings.boulderingGradingSystem);
          },
          child: const Text("BOULDERING"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(
                context, context.bloc.state.settings.sportGradingSystem);
          },
          child: const Text("SPORT"),
        ),
      ],
    );
  }
}
