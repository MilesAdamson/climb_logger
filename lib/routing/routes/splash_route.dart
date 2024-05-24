import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/login/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashRoute extends AppRoute {
  const SplashRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: settings,
      );
}
