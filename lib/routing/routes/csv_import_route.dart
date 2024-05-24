import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/csv/csv_import_screen.dart';
import 'package:flutter/material.dart';

class CsvImportRoute extends AppRoute {
  const CsvImportRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const CsvImportScreen(),
        settings: settings,
      );
}
