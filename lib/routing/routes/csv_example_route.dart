import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/csv/example_csv_screen.dart';
import 'package:flutter/material.dart';

class CsvExampleRoute extends AppRoute {
  const CsvExampleRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const CsvExampleScreen(),
        settings: settings,
      );
}
