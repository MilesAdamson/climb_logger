import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MoodCalendar extends StatelessWidget {
  static final highlightColor = Colors.grey[800]!;
  static const datePad = Duration(days: 30);

  final List<TrainingNotesModel> trainingNotes;
  final void Function(DateTime dateTime) onDateSelected;
  final DateTime selectedDay;
  final MoodType moodType;

  late final dates = trainingNotes
      .map((notes) => notes.dateTime.truncate())
      .toList()
    ..sort((a, b) => a.compareTo(b));

  MoodCalendar({
    Key? key,
    required this.trainingNotes,
    required this.onDateSelected,
    required this.selectedDay,
    required this.moodType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: buildCalendarStyle(),
      selectedDayPredicate: buildSelectedDays,
      calendarBuilders: calendarBuilders(),
      currentDay: selectedDay,
      focusedDay: selectedDay,
      onDaySelected: (selected, _) => onDateSelected(selected),
      firstDay: dates.first.subtract(datePad),
      lastDay: dates.last.add(datePad),
      calendarFormat: CalendarFormat.month,
      availableCalendarFormats: const {
        CalendarFormat.month: "Month",
      },
    );
  }

  CalendarBuilders<dynamic> calendarBuilders() {
    return CalendarBuilders(
      selectedBuilder: (context, dateTime, _) {
        final notes = trainingNotes
            .firstWhereOrNull((notes) => notes.dateTime == dateTime.truncate());

        final sentiment = notes?.sentimentOfMoodType(moodType);
        if (sentiment != null) {
          return buildIcon(dateTime, sentiment);
        }

        return null;
      },
    );
  }

  bool buildSelectedDays(DateTime day) =>
      dates.contains(day.truncate()) ||
      day.truncate() == selectedDay.truncate();

  CalendarStyle buildCalendarStyle() {
    return CalendarStyle(
      selectedDecoration: BoxDecoration(
        color: highlightColor,
        shape: BoxShape.circle,
      ),
      isTodayHighlighted: false,
    );
  }

  Center buildIcon(DateTime dateTime, Sentiment sentiment) {
    return Center(
      child: CircleAvatar(
        backgroundColor: dateTime.truncate() == selectedDay.truncate()
            ? highlightColor
            : Colors.transparent,
        child: Icon(
          sentiment.icon,
          color: sentiment.color,
        ),
      ),
    );
  }
}
