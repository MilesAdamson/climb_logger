import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/bottom_sheets/add_notes_bottom_sheet.dart';
import 'package:climb_logger/components/bottom_sheets/chart_settings_bottom_sheet.dart';
import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/user_input/mood_selector.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/training_notes_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:flutter/material.dart';

class TrainingNotesScreen extends StatelessWidget {
  final DateTime dateTime;

  bool get isToday => dateTime.truncate() == DateTime.now().truncate();

  String get dateLabel => isToday
      ? "How are you feeling today?"
      : "How were you feeling on ${dateTime.formattedDate}?";

  TrainingNotesScreen({
    Key? key,
    required this.dateTime,
  }) : super(key: key) {
    assert(dateTime == dateTime.truncate(),
        "$TrainingNotesScreen expects date to be truncated");
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      buildWhen: (a, b) =>
          a.trainingNotesMap[dateTime]?.data() !=
          b.trainingNotesMap[dateTime]?.data(),
      builder: (context, state) {
        final trainingNotes = state.trainingNotesMap[dateTime]?.data() ??
            TrainingNotesModel.newNotesForDate(dateTime);

        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final canContinue = await showInterstitialAd(
                context,
                "Viewing your mood history requires watching an ad",
              );

              if (!canContinue) return;

              Navigator.of(context).moodHistory();
            },
            label: const Text("View mood history"),
            icon: const Icon(kMoodIcon),
          ),
          appBar: AppBar(
            title: Text(dateTime.formattedDateAndYear),
          ),
          bottomNavigationBar: const BottomBannerAd(),
          body: ListView(
            padding: kListViewPadding,
            children: [
              buildNotesListTile(context, trainingNotes),
              if (trainingNotes.freeformNotes != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    trainingNotes.freeformNotes!,
                  ),
                ),
              const Divider(),
              ListTile(
                title: Text(
                  "Chart",
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: const Text(
                  "Scatter plot of the climbs you did",
                ),
                trailing: TextButton(
                  child: const Text("VIEW"),
                  onPressed: () => showChart(context),
                ),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  dateLabel,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: const Text(
                  "This information is used to build your mood history and mood calendar.",
                ),
              ),
              SentimentSelector(
                title: "Mood",
                sentiment: trainingNotes.mood,
                onChanged: (s) {
                  context.bloc.add(UpsertTrainingNotesEvent(
                      trainingNotes.copyWith(mood: s)));
                },
              ),
              SentimentSelector(
                title: "Sleep",
                sentiment: trainingNotes.sleep,
                onChanged: (s) {
                  context.bloc.add(UpsertTrainingNotesEvent(
                      trainingNotes.copyWith(sleep: s)));
                },
              ),
              SentimentSelector(
                title: "Stress",
                sentiment: trainingNotes.stress,
                onChanged: (s) {
                  context.bloc.add(UpsertTrainingNotesEvent(
                      trainingNotes.copyWith(stress: s)));
                },
              ),
              SentimentSelector(
                title: "Diet",
                sentiment: trainingNotes.diet,
                onChanged: (s) {
                  context.bloc.add(UpsertTrainingNotesEvent(
                      trainingNotes.copyWith(diet: s)));
                },
              ),
              SentimentSelector(
                title: "Energy",
                sentiment: trainingNotes.energy,
                onChanged: (s) {
                  context.bloc.add(UpsertTrainingNotesEvent(
                      trainingNotes.copyWith(energy: s)));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile buildNotesListTile(
    BuildContext context,
    TrainingNotesModel trainingNotes,
  ) {
    return ListTile(
      title: Text(
        "Notes",
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: trainingNotes.freeformNotes != null
          ? null
          : Text(
              "You can add freeform notes for your "
              "session on ${dateTime.formattedDate}.",
            ),
      trailing: TextButton(
        child: const Text("EDIT"),
        onPressed: () async {
          final notes = await showEditNotesBottomSheet(
            context,
            trainingNotes.freeformNotes,
          );

          if (notes != null) {
            context.bloc.add(
                UpsertTrainingNotesEvent(trainingNotes.copyWith(notes: notes)));
          }
        },
      ),
    );
  }

  void showChart(BuildContext context) async {
    final entries = context.bloc.state.logbookEntryMap
        .mapToData()
        .where((logbookEntry) =>
            logbookEntry.dateTime.truncate() == dateTime.truncate())
        .toList();

    if (entries.isEmpty) {
      showConfirmationDialog(
        context,
        title: "No Climbs",
        message: "This feature shows your climbs (not hangboarding) on "
            "a chart, but there are none logged.",
        showCancelButton: false,
      );

      return;
    }

    final canContinue = await showInterstitialAd(
      context,
      "Viewing your training day chart requires watching an ad.",
    );

    if (!canContinue) return;

    final gradingSystemsInEntries =
        entries.map((e) => e.gradingSystem.systemKey).toSet();

    GradingSystem? gradingSystem;

    // With only 1 climb type and grade type, show them the
    // chart without prompting for chart settings
    if (gradingSystemsInEntries.length == 1) {
      gradingSystem = gradeMap[gradingSystemsInEntries.single]!;
      Navigator.of(context).chart(
        ChartType.scatter,
        ChartSettingsModel(
          true,
          true,
          true,
          true,
          gradingSystem.chartYAxisType,
          gradingSystem,
        ),
        entries: entries,
      );

      return;
    }

    final settings =
        await showChartSettingsBottomSheet(context, ChartType.scatter);

    if (settings != null) {
      Navigator.of(context).chart(
        ChartType.scatter,
        settings,
        entries: entries,
      );
    }
  }
}
