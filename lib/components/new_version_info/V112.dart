// ignore_for_file: file_names

import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/mood_history/mood_calendar.dart';
import 'package:climb_logger/components/mood_history/mood_summary_row.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:flutter/material.dart';

class V112 extends StatefulWidget {
  const V112({Key? key}) : super(key: key);

  @override
  State<V112> createState() => _V112State();
}

class _V112State extends State<V112> {
  DateTime selectedDate = DateTime(2022, 4, 19);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Training Notes",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "You can now add notes to each day about how you were feeling. "
            "Use a selection panel to choose how "
            "you were feeling on 5 different topics: mood, sleep, stress, diet and energy.",
          ),
        ),
        MoodSummaryRow(
          trainingNotes: TrainingNotesModel(
            DateTime.now().truncate(),
            null,
            Sentiment.veryPoor,
            Sentiment.poor,
            Sentiment.neutral,
            Sentiment.good,
            Sentiment.veryGood,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "To add notes to a date you climbed or trained hangboard, "
            "use the notes button on its date divider on your logbook screen.\n\nExample:",
          ),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.only(right: 4.0),
          title: Text(
            DateTime.now().formattedDate,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: const Text("Press notes on a day in your logbook!"),
          trailing: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2.0),
            ),
            child: TextButton(
              child: const Text("NOTES"),
              onPressed: () {},
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(right: 8.0),
          trailing: const Text("75"),
          onTap: null,
          title: const Text("Redpoint"),
          subtitle: const Text("8:24 PM"),
          leading: GradeIcon(
            color: AscentType.redpoint.color(context),
            gradeLabel: "Vb-",
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Mood Calendar",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Once you have rated how you were feeling on some climbing days, "
            "you can view your mood calendar. It shows a record of the metric you selected (mood, sleep, stress, diet, and energy).",
          ),
        ),
        MoodCalendar(
          selectedDay: selectedDate,
          onDateSelected: (s) {
            setState(() {
              selectedDate = s;
            });
          },
          moodType: MoodType.mood,
          trainingNotes: [
            TrainingNotesModel(DateTime(2022, 4, 19), null, Sentiment.good,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 20), null, Sentiment.veryGood,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 21), null, Sentiment.good,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 25), null, Sentiment.veryGood,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 7), null, Sentiment.poor, null,
                null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 8), null, Sentiment.veryGood,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 10), null, Sentiment.neutral,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 12), null, Sentiment.veryGood,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 15), null, Sentiment.good,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 5), null, Sentiment.veryGood,
                null, null, null, null),
            TrainingNotesModel(DateTime(2022, 4, 30), null, Sentiment.veryPoor,
                null, null, null, null),
          ],
        ),
      ],
    );
  }
}
