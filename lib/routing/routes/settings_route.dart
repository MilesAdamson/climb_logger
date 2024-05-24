import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsRoute extends AppRoute {
  const SettingsRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
        settings: settings,
      );
}
