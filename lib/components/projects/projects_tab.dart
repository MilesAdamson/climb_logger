import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/components/loading_bars.dart';
import 'package:climb_logger/components/projects/project_card.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({Key? key}) : super(key: key);

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

          final children = buildListViewWidgets(state, context);

          return ListView.builder(
            padding: kListViewPadding,
            itemCount: children.length,
            itemBuilder: (context, i) => children[i],
          );
        }),
      );
    });
  }

  /// Always maps incomplete goals at the top of the list.
  /// If both incomplete and completed goals, the completed ones are in
  /// an expansion tile.
  ///
  /// If all are completed, they are put directly into the list
  /// view instead of an expansion tile
  List<Widget> buildListViewWidgets(AppState state, BuildContext context) {
    final viewModels = state.sortedProjectDocuments
        .map((e) => ProjectViewModel.fromState(e.id, state));

    if (viewModels.isEmpty) {
      return const <Widget>[
        EmptyState(
          icon: kProjectIcon,
          title: "Projects",
          description:
              'Projects track your progress on a climb. As you work on a project, you can tap "New log"'
              ' to record your work. Select "Project" as the ascent type until you send it!'
              '\n\n'
              'If you log a redpoint, the project '
              'will be marked as completed. On charts, you can view project attempts.',
        )
      ];
    }

    final completeProjects =
        viewModels.where((project) => project.projectIsCompleted);
    final incompleteProjects =
        viewModels.where((project) => !project.projectIsCompleted);

    final widgets = <Widget>[
      ...incompleteProjects.map(
        (viewModel) => ProjectCard(
          onPressed: () =>
              Navigator.of(context).project(viewModel.projectDocument.id),
          projectId: viewModel.projectDocument.id,
        ),
      ),
      if (completeProjects.isNotEmpty && incompleteProjects.isNotEmpty)
        ExpansionTile(
          title: const Text(
            "Completed",
          ),
          children: [
            ...completeProjects.map(
              (viewModel) => ProjectCard(
                onPressed: () =>
                    Navigator.of(context).project(viewModel.projectDocument.id),
                projectId: viewModel.projectDocument.id,
              ),
            ),
          ],
        ),
      if (completeProjects.isNotEmpty && incompleteProjects.isEmpty)
        ...completeProjects.map(
          (viewModel) => ProjectCard(
            onPressed: () =>
                Navigator.of(context).project(viewModel.projectDocument.id),
            projectId: viewModel.projectDocument.id,
          ),
        ),
    ];
    return widgets;
  }
}
