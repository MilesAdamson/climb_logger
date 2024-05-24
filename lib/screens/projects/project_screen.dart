import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/components/dialogs/delete_project_dialog.dart';
import 'package:climb_logger/components/empty_state.dart';
import 'package:climb_logger/components/logbook/tags_display.dart';
import 'package:climb_logger/components/project_builder.dart';
import 'package:climb_logger/components/projects/beta_list_tile.dart';
import 'package:climb_logger/components/projects/project_card.dart';
import 'package:climb_logger/components/projects/project_logbook_entry_list_tile.dart';
import 'package:climb_logger/models/chart_settings_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/chart_type.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  final String projectId;

  const ProjectScreen({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectBuilder(
        projectId: projectId,
        builder: (context, viewModel) {
          if (!viewModel.isLoaded) {
            return const Scaffold(
              bottomNavigationBar: BottomBannerAd(),
            );
          }

          final project = viewModel.project;

          return Scaffold(
            bottomNavigationBar: const BottomBannerAd(),
            floatingActionButton: buildFloatingActionButton(
              project,
              viewModel,
              context,
            ),
            appBar: AppBar(
              title: Text(project.name),
            ),
            body: ListView(
              padding: kListViewPadding,
              children: [
                ProjectCard(
                  projectId: projectId,
                  onPressed: null,
                ),
                if (viewModel.relatedEntryDocuments.isNotEmpty)
                  ListTile(
                    title: Text(
                      "Logbook Entries for ${project.name}",
                    ),
                    subtitle: const Text(
                      "Logbook entries for this project are grouped below.",
                    ),
                  ),
                ListTile(
                  title: Text(project.createdAtLabel),
                  subtitle: const Text("Created On"),
                ),
                ListTile(
                  title: Text(project.wallType.label),
                  subtitle: const Text("Wall Type"),
                ),
                TagsDisplay(
                  tags: project.tags,
                  ascentType: AscentType.project,
                ),
                if (viewModel.hasEntries) const Divider(),
                ...viewModel.sortedEntryDocuments.map(
                  (doc) => ProjectLogbookEntryListTile(
                    document: doc,
                  ),
                ),
                const Divider(),
                buildEditButton(context, viewModel),
                buildDeleteButton(context, viewModel),
                if (viewModel.hasEntries) buildChartButton(context, viewModel),
                buildBetaButton(context, viewModel),
                const Divider(),
                if (viewModel.project.beta.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "No beta yet.\n\nYou can add ordered steps to this project with the \"Beta\" button above.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ...viewModel.project.beta.map(
                  (item) => BetaListTile(
                    item: item,
                    beta: viewModel.project.beta,
                  ),
                )
              ],
            ),
          );
        });
  }

  ListTile buildBetaButton(BuildContext context, ProjectViewModel viewModel) {
    return ListTile(
      title: const Text("Beta"),
      subtitle: const Text("Edit your beta"),
      trailing: const Icon(Icons.list),
      onTap: () async {
        final beta =
            await Navigator.of(context).projectBeta(viewModel.project.beta);

        if (beta != null) {
          context.bloc.add(EditProjectEvent(
            viewModel.project.copyWith(beta: beta),
            projectId,
          ));
        }
      },
    );
  }

  ListTile buildChartButton(BuildContext context, ProjectViewModel viewModel) {
    return ListTile(
      title: const Text("Plot"),
      subtitle: const Text("View your attempts on a scatter plot"),
      trailing: const Icon(kChartIcon),
      onTap: () {
        showChart(context, viewModel);
      },
    );
  }

  ListTile buildEditButton(BuildContext context, ProjectViewModel viewModel) {
    return ListTile(
      title: const Text("Edit"),
      subtitle: const Text(
          "Editing this project will update all of its logbook entries"),
      trailing: const Icon(Icons.edit),
      onTap: () async {
        final edited = await Navigator.of(context).projectCreation(
          initialData: viewModel.project,
        );

        if (edited != null) {
          context.bloc.add(EditProjectEvent(edited, projectId));
        }
      },
    );
  }

  EmptyState buildEmptyState() {
    return const EmptyState(
      icon: Icons.playlist_add_check,
      title: "Projects",
      description:
          'Projects track your progress on a climb. As you work on a project, you can tap "New log"'
          ' from this screen to record your work. Select "Project" '
          'as the ascent type until you send it!'
          '\n\n'
          'If you log a redpoint, the project '
          'will be marked as completed. On charts, you can view project attempts.',
    );
  }

  ListTile buildDeleteButton(BuildContext context, ProjectViewModel viewModel) {
    return ListTile(
      title: const Text("Delete"),
      subtitle: const Text("Permanently deletes this project"),
      trailing: const Icon(Icons.delete),
      onTap: () async {
        final option = await showDeleteProjectDialog(context, viewModel);

        if (option != null) {
          Navigator.pop(context);
          context.bloc.add(DeleteProjectEvent(viewModel, option));
        }
      },
    );
  }

  Widget? buildFloatingActionButton(
    ProjectModel project,
    ProjectViewModel viewModel,
    BuildContext context,
  ) {
    if (viewModel.projectIsCompleted) {
      return null;
    }

    return FloatingActionButton.extended(
      onPressed: () async {
        final logbookEntry =
            await Navigator.of(context).logbookCreationForProject(
          project,
          AscentType.project,
        );

        if (logbookEntry != null) {
          context.bloc.add(AddLogbookToProjectEvent(
            logbookEntry,
            projectId,
          ));
        }
      },
      label: Text("New log for ${project.name}"),
      icon: const Icon(Icons.add),
    );
  }

  void showChart(BuildContext context, ProjectViewModel viewModel) async {
    assert(viewModel.hasEntries);

    final canContinue = await showInterstitialAd(
      context,
      "Viewing your training day chart requires watching an ad.",
    );

    if (!canContinue) return;

    final entries = viewModel.relatedEntries;
    final gradingSystem = viewModel.relatedEntries.first.gradingSystem;

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
}
