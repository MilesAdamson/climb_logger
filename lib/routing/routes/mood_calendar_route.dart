import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/mood_history/mood_calendar_screen.dart';
import 'package:flutter/material.dart';

class MoodCalendarRoute extends AppRoute {
  const MoodCalendarRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => const MoodCalendarScreen(),
        settings: settings,
      );
}
