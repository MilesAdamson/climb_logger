import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

typedef FutureVoidCallback = Future<bool> Function();

class LoadMoreButton extends StatefulWidget {
  const LoadMoreButton({Key? key}) : super(key: key);

  @override
  State<LoadMoreButton> createState() => LoadMoreButtonState();
}

class LoadMoreButtonState extends State<LoadMoreButton> {
  bool hasLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (hasLoaded) {
      return const SizedBox.shrink();
    }

    return TextButton(
      onPressed: () async {
        final canContinue = await showInterstitialAd(
          context,
          "Loading older logbook entries requires watching an ad",
        );
        if (!canContinue) {
          return;
        }

        context.bloc.add(LoadAllLogbooksEvent());
        setState(() => hasLoaded = true);
      },
      child: const Text("LOAD MORE"),
    );
  }
}
