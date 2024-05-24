import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/logbooks/logbook_entry_screen.dart';
import 'package:flutter/material.dart';

class LogbookEntryRoute extends AppRoute {
  const LogbookEntryRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => LogbookEntryScreen(
          logbookEntryId: settings.arguments as String,
        ),
        settings: settings,
      );
}
