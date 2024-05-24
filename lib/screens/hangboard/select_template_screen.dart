import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/hangboarding/template_card.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/user_input/hangboard_difficulty_selector.dart';
import 'package:climb_logger/hangboard_templates/general_training_template.dart';
import 'package:climb_logger/hangboard_templates/hangboard_difficulty.dart';
import 'package:climb_logger/hangboard_templates/max_hangs_template.dart';
import 'package:climb_logger/hangboard_templates/repeaters_template.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class SelectTemplateScreen extends StatefulWidget {
  const SelectTemplateScreen({Key? key}) : super(key: key);

  @override
  State<SelectTemplateScreen> createState() => SelectTemplateScreenState();
}

class SelectTemplateScreenState extends State<SelectTemplateScreen> {
  HangboardDifficulty difficulty = HangboardDifficulty.beginner;

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      final measurementSystem = state.settings.measurementSystem;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Select Template"),
          actions: [
            IconButton(
              onPressed: Navigator.of(context).settings,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBannerAd(),
        body: Column(
          children: [
            HangboardDifficultySelector(
              difficulty: difficulty,
              onChanged: (selected) => setState(() => difficulty = selected),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                padding: kListViewPadding,
                children: [
                  TemplateCard(
                    template: RepeatersTemplate(
                      difficulty,
                      measurementSystem,
                    ),
                  ),
                  TemplateCard(
                    template: MaxHangsTemplate(
                      difficulty,
                      measurementSystem,
                    ),
                  ),
                  TemplateCard(
                    template: GeneralTrainingTemplate(
                      difficulty,
                      measurementSystem,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
