import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeRoute extends AppRoute {
  const HomeRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: settings,
      );
}
