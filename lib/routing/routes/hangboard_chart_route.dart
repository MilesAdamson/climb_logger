import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/charts/hangboard_chart_screen.dart';
import 'package:flutter/material.dart';

class HangboardChartRoute extends AppRoute {
  const HangboardChartRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => HangboardChartScreen(
          args: settings.arguments as HangboardChartScreenArgs,
        ),
        settings: settings,
      );
}
