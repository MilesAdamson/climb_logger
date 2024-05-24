import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/csv/csv_import_preview_screen.dart';
import 'package:flutter/material.dart';

class CsvImportPreviewRoute extends AppRoute {
  const CsvImportPreviewRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<GoalModel>(
        builder: (context) => CsvImportPreviewScreen(
          entries: settings.arguments as List<LogbookEntryModel>,
        ),
        settings: settings,
      );
}
