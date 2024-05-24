import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/hangboard_routine_creation_screen.dart';
import 'package:flutter/material.dart';

class HangboardRoutineCreationRoute extends AppRoute {
  const HangboardRoutineCreationRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<HangboardRoutineModel>(
        builder: (context) => HangboardRoutineCreationScreen(
          initialData: settings.arguments as HangboardRoutineModel?,
        ),
        settings: settings,
      );
}
