import 'package:climb_logger/models/logbook_entry_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/projects/create_logbook_for_project_screen.dart';
import 'package:flutter/material.dart';

class CreateLogbookForProjectRoute extends AppRoute {
  const CreateLogbookForProjectRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<LogbookEntryModel>(
        builder: (context) => CreateLogbookForProjectScreen(
          args: settings.arguments as LogbookForProjectArgs,
        ),
        settings: settings,
      );
}
