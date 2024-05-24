import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

class MuteTimerButton extends StatelessWidget {
  const MuteTimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      buildWhen: (a, b) =>
          a.settings.playTimerSounds != b.settings.playTimerSounds,
      builder: (context, appState) {
        return IconButton(
          onPressed: () {
            final settings = appState.settings;
            context.bloc.add(ChangeSettingsEvent(
                settings.copyWith(playTimerSounds: !settings.playTimerSounds)));
          },
          icon: appState.settings.playTimerSounds
              ? const Icon(Icons.volume_up)
              : const Icon(Icons.volume_off),
        );
      },
    );
  }
}
