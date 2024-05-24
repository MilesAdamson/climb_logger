import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/mood_history/mood_summary_row.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:flutter/material.dart';

class DateDivider extends StatelessWidget {
  final DateTime dateTime;
  final bool shouldShowDivider;

  DateDivider({
    Key? key,
    required this.dateTime,
    required this.shouldShowDivider,
  }) : super(key: key) {
    assert(dateTime == dateTime.truncate());
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      builder: (context, state) {
        final score = context.bloc.state.scoreOfTimeRange(
          dateTime,
          dateTime.roundUpToEndOfDay(),
        );

        final trainingNotes = state.trainingNotesMap[dateTime]?.data();

        var subtitle = "$score points";

        if (trainingNotes?.freeformNotes != null) {
          subtitle += ". ${trainingNotes!.freeformNotes}";
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (shouldShowDivider) const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 16.0, right: 4.0),
              title: Text(
                dateTime.formattedDate,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(subtitle),
              trailing: TextButton(
                child: const Text("NOTES"),
                onPressed: () => Navigator.of(context).trainingNotes(dateTime),
              ),
            ),
            if (trainingNotes != null)
              MoodSummaryRow(trainingNotes: trainingNotes),
          ],
        );
      },
    );
  }
}
