import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/select_template_screen.dart';
import 'package:flutter/material.dart';

class TemplateRoute extends AppRoute {
  const TemplateRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const SelectTemplateScreen(),
        settings: settings,
      );
}
