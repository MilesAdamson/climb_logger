import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/projects/project_creation_screen.dart';
import 'package:flutter/material.dart';

class ProjectCreationRoute extends AppRoute {
  const ProjectCreationRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<ProjectModel>(
        builder: (context) => ProjectCreationScreen(
          initialData: settings.arguments as ProjectModel?,
        ),
        settings: settings,
      );
}
