import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/mood_history/mood_history_screen.dart';
import 'package:flutter/material.dart';

class MoodHistoryRoute extends AppRoute {
  const MoodHistoryRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const MoodHistoryScreen(),
        settings: settings,
      );
}
