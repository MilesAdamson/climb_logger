import 'package:flutter/material.dart';

abstract class AppRoute {
  const AppRoute();

  MaterialPageRoute pageRoute(RouteSettings settings);
}
