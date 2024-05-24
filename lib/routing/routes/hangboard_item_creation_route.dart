import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/routing/app_route.dart';
import 'package:climb_logger/screens/hangboard/hangboard_item_creation_screen.dart';
import 'package:flutter/material.dart';

class HangboardItemCreationRoute extends AppRoute {
  const HangboardItemCreationRoute();

  @override
  MaterialPageRoute pageRoute(RouteSettings settings) =>
      MaterialPageRoute<HangboardItemModel>(
        builder: (context) => HangboardItemCreationScreen(
          initialData: settings.arguments as HangboardItemModel?,
        ),
        settings: settings,
      );
}
