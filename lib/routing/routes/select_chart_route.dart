import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/charts/select_chart_screen.dart';
import 'package:flutter/material.dart';

class SelectChartRoute extends AppRoute {
  const SelectChartRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const SelectChartScreen(),
        settings: settings,
      );
}
