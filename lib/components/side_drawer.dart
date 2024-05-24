import 'package:climb_logger/components/app_icon.dart';
import 'package:climb_logger/components/csv/csv_download_list_tile.dart';
import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/dialogs/iap_failed_dialog.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/version_label.dart';
import 'package:climb_logger/components/whats_new_list_tile.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      return Drawer(
        child: ListView(
          children: [
            buildDrawerHeader(),

            // actions
            charts(context),
            moodHistory(context),
            scoringSystem(context),
            tags(context),
            if (state.shouldShowAds) removeAds(context),
            const CsvListTile(),
            const WhatsNewListTile(),
            usageStats(context),
            settings(context),
            logOut(context),
          ],
        ),
      );
    });
  }

  ListTile usageStats(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.query_stats),
      title: const Text("Global usage stats"),
      onTap: Navigator.of(context).stats,
    );
  }

  ListTile tags(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.tag),
      title: const Text("Tags"),
      onTap: Navigator.of(context).tags,
    );
  }

  ListTile removeAds(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.monetization_on_outlined),
      title: const Text("Remove ads"),
      onTap: () async {
        final service = context.read<IapService>();
        try {
          await service.removeAds();
        } on IapException catch (e, s) {
          Logger.captureException(e, s);
          showIapFailedDialog(context, e.message);
        }
      },
    );
  }

  ListTile scoringSystem(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.info_outline),
      title: const Text("Scoring system"),
      onTap: () => Navigator.of(context).scoringSystemInfo(),
    );
  }

  ListTile charts(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(kChartIcon),
      title: const Text("Charts"),
      onTap: () async {
        final canContinue = await showInterstitialAd(
          context,
          "Viewing your charts requires watching an ad.",
        );
        if (canContinue) {
          Navigator.of(context).buildChart();
        }
      },
    );
  }

  ListTile moodHistory(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(kMoodIcon),
      title: const Text("Mood history"),
      onTap: () async {
        final canContinue = await showInterstitialAd(
          context,
          "Viewing your training history requires watching an ad.",
        );
        if (canContinue) {
          Navigator.of(context).moodHistory();
        }
      },
    );
  }

  ListTile settings(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.settings),
      title: const Text("Settings"),
      onTap: Navigator.of(context).settings,
    );
  }

  ListTile logOut(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.logout),
      title: const Text("Log out"),
      onTap: () async {
        final confirm = await showConfirmationDialog(
          context,
          message: null,
          title: "Log out?",
        );

        if (confirm) {
          Navigator.of(context).login();
          context.bloc.add(LogoutEvent());
        }
      },
    );
  }

  DrawerHeader buildDrawerHeader() {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppIcon(size: 75),
          VersionLabel(),
        ],
      ),
    );
  }
}
