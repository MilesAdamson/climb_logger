import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/mood_history/training_notes_screen.dart';
import 'package:flutter/material.dart';

class TrainingNotesRoute extends AppRoute {
  const TrainingNotesRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => TrainingNotesScreen(
          dateTime: settings.arguments as DateTime,
        ),
        settings: settings,
      );
}
