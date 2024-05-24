import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/hangboard_routine_screen.dart';
import 'package:flutter/material.dart';

class HangboardRoutineRoute extends AppRoute {
  const HangboardRoutineRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => HangboardRoutineScreen(
          documentId: settings.arguments as String,
        ),
        settings: settings,
      );
}
