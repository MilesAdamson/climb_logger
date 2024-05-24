import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/settings/tags_screen.dart';
import 'package:flutter/material.dart';

class TagsRoute extends AppRoute {
  const TagsRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const TagsScreen(),
        settings: settings,
      );
}
