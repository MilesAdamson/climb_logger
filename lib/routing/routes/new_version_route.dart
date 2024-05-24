import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/new_version_screen.dart';
import 'package:flutter/material.dart';

class NewVersionRoute extends AppRoute {
  const NewVersionRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => NewVersionScreen(
          version: settings.arguments as String,
        ),
        settings: settings,
      );
}
