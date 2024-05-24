import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class LoginRoute extends AppRoute {
  const LoginRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        settings: settings,
      );
}
