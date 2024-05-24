import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/stats_screen.dart';
import 'package:flutter/material.dart';

class StatsRoute extends AppRoute {
  const StatsRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const StatsScreen(),
        settings: settings,
      );
}
