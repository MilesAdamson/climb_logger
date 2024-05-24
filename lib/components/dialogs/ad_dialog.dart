import 'package:climb_logger/components/dialogs/iap_failed_dialog.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<bool> showInterstitialAd(BuildContext context, String message) async {
  if (!context.bloc.state.shouldShowAds) {
    return true;
  }

  final confirm = await showDialog<int>(
    context: context,
    builder: (context) {
      return AdDialog(message: message);
    },
  );

  if (confirm != null) {
    if (!context.bloc.state.shouldShowAds) {
      return true;
    }

    await context.adService.showAd();
    return true;
  }

  return false;
}

class AdDialog extends StatelessWidget {
  final String message;

  const AdDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ad Required"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () async {
            final service = context.read<IapService>();
            try {
              await service.removeAds();
            } on IapException catch (e, s) {
              Logger.captureException(e, s);
              showIapFailedDialog(context, e.message);
            }
          },
          child: const Text("REMOVE ADS"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("CANCEL"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 1);
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
