import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/hangboard_entry_screen.dart';
import 'package:flutter/material.dart';

class HangboardEntryRoute extends AppRoute {
  const HangboardEntryRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => HangboardEntryScreen(
          documentId: settings.arguments as String,
        ),
        settings: settings,
      );
}
