import 'package:climb_logger/charts/chart_scaffold.dart';
import 'package:climb_logger/components/mood_history/mood_calendar.dart';
import 'package:climb_logger/components/mood_history/mood_summary_row.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class MoodCalendarScreen extends StatefulWidget {
  const MoodCalendarScreen({Key? key}) : super(key: key);

  @override
  State<MoodCalendarScreen> createState() => MoodCalendarScreenState();
}

class MoodCalendarScreenState extends State<MoodCalendarScreen> {
  late final trainingNotesMap = context.bloc.state.trainingNotesMap;

  DateTime selectedDay = DateTime.now();

  MoodType moodType = MoodType.values.first;

  @override
  Widget build(BuildContext context) {
    final notesOfSelectedDay = trainingNotesMap.mapToData().firstWhereOrNull(
        (notes) => notes.dateTime.truncate() == selectedDay.truncate());

    return ChartScaffold(
      appBar: AppBar(
        title: Text("${moodType.label} Calendar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: MoodCalendar(
                selectedDay: selectedDay,
                moodType: moodType,
                onDateSelected: (d) => setState(() => selectedDay = d),
                trainingNotes: trainingNotesMap.mapToData(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: Text("Ratings for ${selectedDay.formattedDate}"),
                subtitle: Text(
                  "The calendar only highlights one metric at"
                  " a time, but you can view all ratings for ${selectedDay.formattedDate} below:",
                ),
              ),
            ),
            if (notesOfSelectedDay != null)
              MoodSummaryRow(trainingNotes: notesOfSelectedDay)
            else
              MoodSummaryRow(
                hideIfNoRatings: false,
                trainingNotes: TrainingNotesModel(
                  selectedDay,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                ),
              ),
            buildSelector(),
          ],
        ),
      ),
    );
  }

  ListTile buildSelector() {
    return ListTile(
      title: const Text("Select Metric"),
      subtitle: const Text(
        "The calendar will light up with "
        "your ratings based on this selection",
      ),
      trailing: DropdownButton<MoodType>(
        value: moodType,
        onChanged: (s) {
          if (s != null) {
            setState(() => moodType = s);
          }
        },
        items: MoodType.values
            .map(
              (moodType) => DropdownMenuItem<MoodType>(
                value: moodType,
                child: Text(
                  moodType.label,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
