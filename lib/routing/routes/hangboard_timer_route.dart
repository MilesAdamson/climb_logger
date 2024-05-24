import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/hangboard_timer_screen.dart';
import 'package:flutter/material.dart';

class HangboardTimerRoute extends AppRoute {
  const HangboardTimerRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => HangboardTimerScreen(
          hangboardRoutine: settings.arguments as HangboardRoutineModel,
        ),
        settings: settings,
      );
}
