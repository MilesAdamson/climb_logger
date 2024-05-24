import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/hangboarding/hangboard_item_list_tile.dart';
import 'package:climb_logger/components/hangboarding/hangboard_routine_card.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:flutter/material.dart';

class HangboardRoutineScreen extends StatelessWidget {
  final String documentId;

  const HangboardRoutineScreen({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final document = state.hangboardRoutineMap[documentId];
      final routine = document?.data();

      if (document == null || routine == null) {
        return const Scaffold(
          bottomNavigationBar: BottomBannerAd(),
        );
      }

      final workout = routine.completeWorkout;

      return Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        appBar: AppBar(
          title: Text(routine.name),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).hangboardTimer(routine),
          icon: const Icon(Icons.timer),
          label: const Text("Start"),
        ),
        body: ListView(
          padding: kListViewPadding,
          children: [
            HangboardRoutineCard(
              onPressed: null,
              document: document,
            ),
            ListTile(
              title: Text(routine.createdAt.formattedDateAndTime),
              subtitle: const Text("Created on"),
            ),
            ListTile(
              title: Text(routine.score.toString()),
              subtitle: const Text("Score"),
              trailing: IconButton(
                icon: const Icon(Icons.help),
                onPressed: Navigator.of(context).scoringSystemInfo,
              ),
            ),
            ListTile(
              title: Text(routine.restBetweenSetsDurationLabel),
              subtitle: const Text("Rest between sets"),
            ),
            ListTile(
              title: Text(routine.totalDurationLabel),
              subtitle: const Text("Total duration"),
            ),
            const Divider(),
            buildLogListTile(context, routine),
            buildEditListTile(context, routine),
            buildDeleteListTile(context, routine),
            const Divider(),
            ...workout.map(
              (item) => HangboardItemListTile(
                item: item,
                workout: workout,
              ),
            ),
          ],
        ),
      );
    });
  }

  ListTile buildDeleteListTile(
      BuildContext context, HangboardRoutineModel routine) {
    return ListTile(
      title: const Text("Delete"),
      leading: const Icon(Icons.delete),
      subtitle: const Text(
        "Deleting this routine will not delete any logbook entries",
      ),
      onTap: () async {
        final confirm = await showConfirmationDialog(
          context,
          title: "Delete ${routine.name}?",
          message: "This cannot be undone",
        );

        if (confirm) {
          Navigator.pop(context);
          context.bloc.add(DeleteHangboardRoutineEvent(documentId));
        }
      },
    );
  }

  ListTile buildEditListTile(
    BuildContext context,
    HangboardRoutineModel routine,
  ) {
    return ListTile(
      title: const Text("Edit"),
      leading: const Icon(Icons.edit),
      subtitle: const Text(
        "Editing this routine will not modify any"
        " logbook entries from the old version",
      ),
      onTap: () async {
        final edited = await Navigator.of(context)
            .hangboardRoutineCreation(initialData: routine);
        if (edited != null) {
          context.bloc.add(EditHangboardRoutineEvent(documentId, edited));
        }
      },
    );
  }

  ListTile buildLogListTile(
      BuildContext context, HangboardRoutineModel routine) {
    return ListTile(
      title: const Text("Log as completed"),
      leading: const Icon(Icons.check),
      subtitle: const Text(
        "Adds a logbook entry with the current time, without opening the timer",
      ),
      onTap: () async {
        final confirm = await showConfirmationDialog(
          context,
          title: "Log ${routine.name}?",
          message: "This will create a new logbook entry "
              "from this hangboard routine",
        );

        if (confirm) {
          context.bloc.add(
            HangboardRoutineCompletedEvent(
              HangboardEntryModel(
                routine,
                DateTime.now(),
              ),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Logged ${routine.name} for ${DateTime.now().formattedDate}"),
            ),
          );
        }
      },
    );
  }
}
