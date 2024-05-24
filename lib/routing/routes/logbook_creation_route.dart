import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/logbooks/logbook_creation_screen.dart';
import 'package:flutter/material.dart';

class LogbookCreationRoute extends AppRoute {
  const LogbookCreationRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<LogbookEntryModel>(
        builder: (context) => LogbookCreationScreen(
          initialData: settings.arguments as LogbookEntryModel?,
        ),
        settings: settings,
      );
}
