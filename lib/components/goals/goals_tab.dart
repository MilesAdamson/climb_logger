import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/components/goals/goal_card.dart';
import 'package:climb_logger/components/loading_bars.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class GoalsTab extends StatelessWidget {
  const GoalsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (!state.appReady) {
                return const Center(
                  child: LoadingBars(),
                );
              }

              if (state.goalDocList.isNotEmpty) {
                List<Widget> widgets = buildListViewWidgets(state, context);

                return ListView.builder(
                  padding: kListViewPadding,
                  itemCount: widgets.length,
                  itemBuilder: (context, i) => widgets[i],
                );
              }

              return _buildEmptyState(context);
            },
          ),
        );
      },
    );
  }

  /// Always maps incomplete goals at the top of the list.
  /// If both incomplete and completed goals, the completed ones are in
  /// an expansion tile.
  ///
  /// If all are completed, they are put directly into the list
  /// view instead of an expansion tile
  List<Widget> buildListViewWidgets(AppState state, BuildContext context) {
    final incompleteGoals = state.incompleteGoals;
    final completeGoals = state.completeGoals;

    final widgets = <Widget>[
      ...incompleteGoals.map((e) => GoalCard(
            document: e,
            onPressed: () => Navigator.of(context).goal(e.id),
          )),
      if (completeGoals.isNotEmpty && incompleteGoals.isNotEmpty)
        ExpansionTile(
          title: const Text(
            "Completed",
          ),
          children: [
            ...completeGoals.map(
              (e) => GoalCard(
                document: e,
                onPressed: () => Navigator.of(context).goal(e.id),
              ),
            ),
          ],
        ),
      if (completeGoals.isNotEmpty && incompleteGoals.isEmpty)
        ...completeGoals.map(
          (e) => GoalCard(
            document: e,
            onPressed: () => Navigator.of(context).goal(e.id),
          ),
        ),
    ];
    return widgets;
  }

  Center _buildEmptyState(BuildContext context) {
    return Center(
      child: ListView(
        padding: kListViewPadding,
        children: const [
          EmptyState(
            icon: Icons.fact_check_outlined,
            title: "Goals",
            description:
                "Goals consist of a set of objectives. For example, redpoint three 12a's. "
                "A goal can have any number of objectives, "
                "all of which you would like to complete by a target date."
                "\n\n"
                "Note that ascents will only contribute if their grading system matches the one "
                "the goal uses. Goals work best if you log ascents with only one "
                "grading system both bouldering, and one for sport climbs.",
          ),
        ],
      ),
    );
  }
}
