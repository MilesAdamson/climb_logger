import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/hangboarding/hangboard_entry_list_tile.dart';
import 'package:climb_logger/components/hangboarding/hangboard_item_list_tile.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:flutter/material.dart';

class HangboardEntryScreen extends StatelessWidget {
  final String documentId;

  const HangboardEntryScreen({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final document = state.hangboardEntryMap[documentId];
      final entry = document?.data();

      if (document == null || entry == null) {
        return const Scaffold(
          bottomNavigationBar: BottomBannerAd(),
        );
      }

      final workout = entry.hangboardRoutine.completeWorkout;

      return Scaffold(
        bottomNavigationBar: const BottomBannerAd(),
        appBar: AppBar(
          title: Text(entry.hangboardRoutine.name),
        ),
        body: ListView(
          padding: kListViewPadding,
          children: [
            HangboardEntryListTile(document: document),
            ListTile(
              title: Text(entry.dateTime.formattedDateAndTime),
              subtitle: const Text("Date"),
            ),
            ListTile(
              title: Text(entry.hangboardRoutine.sets == 1
                  ? "1 Set"
                  : "${entry.hangboardRoutine.sets} Sets"),
            ),
            ListTile(
              title: Text(entry.hangboardRoutine.restBetweenSetsDurationLabel),
              subtitle: const Text("Rest between sets"),
            ),
            ListTile(
              title: Text(entry.hangboardRoutine.totalDurationLabel),
              subtitle: const Text("Total duration"),
            ),
            const Divider(),
            buildTimerListTile(context, entry.hangboardRoutine),
            buildCloneListTile(context, entry.hangboardRoutine),
            buildDeleteListTile(context, entry),
            const Divider(),
            const ListTile(
              subtitle: Text(
                "The workout listed is how it was"
                " when the routine was completed. If you edit "
                "the hangboard routine later, this will show the "
                "version when it was logged",
              ),
            ),
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
      BuildContext context, HangboardEntryModel entry) {
    return ListTile(
      title: const Text("Delete"),
      leading: const Icon(Icons.delete),
      subtitle: const Text(
        "Delete this hangboard logbook entry",
      ),
      onTap: () async {
        final confirm = await showConfirmationDialog(
          context,
          title: "Delete Hangboard Entry?",
          message: "This cannot be undone",
        );

        if (confirm) {
          Navigator.pop(context);
          context.bloc.add(DeleteHangboardEntryEvent(documentId));
        }
      },
    );
  }

  ListTile buildTimerListTile(
    BuildContext context,
    HangboardRoutineModel routine,
  ) {
    return ListTile(
      title: const Text("Open Timer"),
      leading: const Icon(Icons.timer),
      subtitle: const Text(
        "Open this hangboard routine in the workout timer",
      ),
      onTap: () => Navigator.of(context).hangboardTimer(routine),
    );
  }

  ListTile buildCloneListTile(
      BuildContext context, HangboardRoutineModel routine) {
    return ListTile(
      title: const Text("Clone"),
      leading: const Icon(Icons.copy),
      subtitle: const Text(
        "Saves a copy of this hangboard logbook entry with the current date and time",
      ),
      onTap: () async {
        final confirm = await showConfirmationDialog(
          context,
          title: "Log ${routine.name}?",
          message: "This will save a copy of this hangboard"
              " logbook entry with the current date and time",
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
