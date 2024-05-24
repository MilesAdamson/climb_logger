import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/charts/chart_screen.dart';
import 'package:flutter/material.dart';

class ChartRoute extends AppRoute {
  const ChartRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => ChartScreen(
          args: settings.arguments as ChartScreenArgs,
        ),
        settings: settings,
      );
}
