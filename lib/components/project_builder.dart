import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ProjectWidgetBuilder = Widget Function(
  BuildContext context,
  ProjectViewModel viewModel,
);

class ProjectBuilder extends StatelessWidget {
  final String projectId;
  final ProjectWidgetBuilder builder;

  const ProjectBuilder({
    Key? key,
    required this.builder,
    required this.projectId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppState>(builder: (context, state) {
      final project = state.projectMap[projectId]?.data();

      if (project != null) {
        final viewModel = ProjectViewModel.fromState(projectId, state);
        return builder(context, viewModel);
      }

      return const SizedBox.shrink();
    });
  }
}
