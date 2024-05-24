import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/hangboard_routines_screen.dart';
import 'package:flutter/material.dart';

class HangboardRoutinesRoute extends AppRoute {
  const HangboardRoutinesRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const HangboardRoutinesScreen(),
        settings: settings,
      );
}
