import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/goals/goal_screen.dart';
import 'package:flutter/material.dart';

class GoalRoute extends AppRoute {
  const GoalRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => GoalScreen(
          goalId: settings.arguments as String,
        ),
        settings: settings,
      );
}
