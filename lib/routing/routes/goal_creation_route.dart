import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/goals/goal_creation_screen.dart';
import 'package:flutter/material.dart';

class GoalCreationRoute extends AppRoute {
  const GoalCreationRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<GoalModel>(
        builder: (context) => GoalCreationScreen(
          initialData: settings.arguments as GoalModel?,
        ),
        settings: settings,
      );
}
