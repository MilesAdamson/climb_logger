import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/components/hangboarding/hangboard_entry_list_tile.dart';
import 'package:climb_logger/components/loading_bars.dart';
import 'package:climb_logger/components/logbook/date_divider.dart';
import 'package:climb_logger/components/logbook/load_more_button.dart';
import 'package:climb_logger/components/logbook/logbook_entry_list_tile.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/user_input/bouldering_grade_radio.dart';
import 'package:climb_logger/components/user_input/sport_grade_radio.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:climb_logger/util/widget_with_date.dart';
import 'package:flutter/material.dart';

class LogbookTab extends StatelessWidget {
  const LogbookTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      return Scaffold(
        body: Builder(builder: (context) {
          if (!state.appReady) {
            return const Center(
              child: LoadingBars(),
            );
          }

          if (state.logbookEntryDocList.isEmpty &&
              state.hangboardEntryDocList.isEmpty) {
            return _buildEmptyState(context);
          }

          final logbookWidgets = state.filteredLogbook.map(
            (document) => WidgetWithDate(
              document.data()!.dateTime,
              LogbookEntryListTile(
                key: Key("${document.data().hashCode}"),
                document: document,
                onPressed: () =>
                    Navigator.of(context).logbookEntry(document.id),
              ),
            ),
          );

          final hangboardWidgets = state.filteredHangboardEntries.map(
            (document) => WidgetWithDate(
              document.data()!.dateTime,
              HangboardEntryListTile(
                key: Key("${document.data().hashCode}"),
                document: document,
                onPressed: () =>
                    Navigator.of(context).hangboardEntry(document.id),
              ),
            ),
          );

          final logbookDates = logbookWidgets
              .map((e) => DateTime(
                    e.dateTime.year,
                    e.dateTime.month,
                    e.dateTime.day,
                  ).roundUpToEndOfDay())
              .toSet();

          final hangboardDates = hangboardWidgets
              .map((e) => DateTime(
                    e.dateTime.year,
                    e.dateTime.month,
                    e.dateTime.day,
                  ).roundUpToEndOfDay())
              .toSet();

          final dates = {
            ...logbookDates,
            ...hangboardDates,
          };

          final sortedDates = dates.map((e) => e.truncate()).toList()
            ..sort((a, b) => b.compareTo(a));

          final dateHeaders = dates.map(
            (date) => WidgetWithDate(
              date,
              DateDivider(
                dateTime: date.truncate(),
                shouldShowDivider: sortedDates.first != date.truncate(),
              ),
            ),
          );

          final loadMoreButton = WidgetWithDate(
            DateTime.fromMillisecondsSinceEpoch(0),
            const LoadMoreButton(),
          );

          final children = <WidgetWithDate>[
            ...dateHeaders,
            ...logbookWidgets,
            ...hangboardWidgets,
            if (logbookWidgets.isEmpty && hangboardWidgets.isEmpty)
              buildFilterEmptyState(context),
            if (state.canLoadMoreLogbookEntries) loadMoreButton,
          ]..sort();

          return ListView.builder(
            padding: kListViewPadding,
            itemCount: children.length,
            itemBuilder: (context, i) => children[i].widget,
          );
        }),
      );
    });
  }

  WidgetWithDate buildFilterEmptyState(BuildContext context) {
    return WidgetWithDate(
      DateTime.now(),
      Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: EmptyState(
          icon: kFilterIcon,
          title: "No Results",
          description: "You have ${context.bloc.state.totalLogbookLength} "
              "logbook entries loaded, but they are not"
              " showing here due to your filter settings.",
        ),
      ),
    );
  }

  Center _buildEmptyState(BuildContext context) {
    final settings = context.bloc.state.settings;
    return Center(
      child: ListView(
        padding: kListViewPadding,
        children: [
          const EmptyState(
            title: 'Logbook',
            icon: kLogbookIcon,
            description:
                "Your logged climbs will be listed here. You can select "
                "your grade preferences below. This can also be changed in the settings.\n\n"
                "Charts and goals only work with one grading system for sport and bouldering at a time.",
          ),
          const Divider(),
          const ListTile(title: Text("Bouldering Grades")),
          BoulderingGradeRadio(
            onChanged: (value) {
              context.bloc.add(
                ChangeSettingsEvent(
                  settings.copyWith(boulderingSystemKey: value.systemKey),
                ),
              );
            },
            gradingSystem: settings.boulderingGradingSystem,
          ),
          const Divider(),
          const ListTile(title: Text("Sport Grades")),
          SportGradeRadio(
            onChanged: (value) {
              context.bloc.add(
                ChangeSettingsEvent(
                  settings.copyWith(sportSystemKey: value.systemKey),
                ),
              );
            },
            gradingSystem: settings.sportGradingSystem,
          ),
        ],
      ),
    );
  }
}
