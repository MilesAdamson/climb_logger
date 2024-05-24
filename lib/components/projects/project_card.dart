import 'package:climb_logger/components/grade_icon.dart';
import 'package:climb_logger/components/project_builder.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String projectId;
  final VoidCallback? onPressed;

  const ProjectCard({
    Key? key,
    required this.projectId,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: projectId,
      child: ProjectBuilder(
        projectId: projectId,
        builder: (context, viewModel) {
          return Opacity(
            opacity: viewModel.projectIsCompleted ? kCompletedItemOpacity : 1.0,
            child: Padding(
              padding: kCardOutsidePadding,
              child: Card(
                child: InkWell(
                  onTap: onPressed,
                  child: _buildTitle(viewModel, context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ListTile _buildTitle(ProjectViewModel viewModel, BuildContext context) {
    return ListTile(
      leading: GradeIcon(
        color: viewModel.ascentType.color(context),
        gradeLabel: viewModel.project.gradeLabel,
      ),
      title: Text(
        viewModel.project.name,
        style: TextStyle(
          decoration:
              viewModel.projectIsCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: viewModel.projectIsCompleted
          ? const Icon(Icons.check_box_outlined)
          : const Icon(Icons.check_box_outline_blank),
      subtitle: Text(viewModel.totalAttemptsLabel),
    );
  }
}
