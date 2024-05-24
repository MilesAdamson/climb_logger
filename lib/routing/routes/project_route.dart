import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/projects/project_screen.dart';
import 'package:flutter/material.dart';

class ProjectRoute extends AppRoute {
  const ProjectRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => ProjectScreen(
          projectId: settings.arguments as String,
        ),
        settings: settings,
      );
}
