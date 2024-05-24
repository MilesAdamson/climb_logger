import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/settings/scoring_info_screen.dart';
import 'package:flutter/material.dart';

class ScoringInfoRoute extends AppRoute {
  const ScoringInfoRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const ScoringInfoScreen(),
        settings: settings,
      );
}
