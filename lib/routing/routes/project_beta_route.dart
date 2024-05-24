import 'package:climb_logger/models/beta_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/projects/beta_editor_screen.dart';
import 'package:flutter/material.dart';

class ProjectBetaRoute extends AppRoute {
  const ProjectBetaRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<List<BetaModel>>(
        builder: (context) => BetaEditorScreen(
          initialBeta: settings.arguments as List<BetaModel>,
        ),
        settings: settings,
      );
}
