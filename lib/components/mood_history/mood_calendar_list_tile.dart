import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:flutter/material.dart';

class MoodCalendarListTile extends StatelessWidget {
  final List<TrainingNotesModel> trainingNotes;

  const MoodCalendarListTile({
    Key? key,
    required this.trainingNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Mood Calendar",
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: const Text(
        "Select one of the metrics (mood, sleep, stress, diet or energy) and view all your ratings on a calendar.",
      ),
      trailing: TextButton(
        child: const Text("VIEW"),
        onPressed: () async {
          if (!trainingNotes.any((notes) => notes.hasAnySentimentsSelected)) {
            showConfirmationDialog(
              context,
              title: "No Data",
              message: "The mood calendar requires you to rate "
                  "how you were feeling on at least one day. "
                  "\n\nTo do that, tap the \"notes\""
                  "button on the logbook tab for a day you climbed.",
              showCancelButton: false,
            );

            return;
          }

          Navigator.of(context).moodCalendar();
        },
      ),
    );
  }
}
