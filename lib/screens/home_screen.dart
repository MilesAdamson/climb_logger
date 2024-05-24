import 'dart:async';

import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/bottom_sheets/filters_bottom_sheet.dart';
import 'package:climb_logger/components/goals/goals_tab.dart';
import 'package:climb_logger/components/logbook/fab_row.dart';
import 'package:climb_logger/components/logbook/logbook_tab.dart';
import 'package:climb_logger/components/projects/projects_tab.dart';
import 'package:climb_logger/components/side_drawer.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/screens/new_version_screen.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final StreamSubscription completedGoalListener;
  late final StreamSubscription newVersionListener;

  @override
  void dispose() {
    completedGoalListener.cancel();
    newVersionListener.cancel();
    super.dispose();
  }

  @override
  void initState() {
    context.bloc.add(InitializeDocumentServiceEvent());
    listenForCompletedGoals();
    listenForNewVersion();
    super.initState();
  }

  void listenForNewVersion() {
    newVersionListener = context.bloc.stream
        .map((state) => state.newVersionNumber)
        .distinct()
        .listen(
      (version) {
        if (version != null && versionContentMap.containsKey(version)) {
          assert(versionContentMap.containsKey(version));
          newVersionListener.cancel();
          Navigator.of(context).whatsNewInVersion(version);
        }
      },
    );
  }

  void listenForCompletedGoals() {
    completedGoalListener = context.bloc.stream
        .map((state) => state.recentlyCompletedGoal)
        .distinct()
        .listen(
      (goal) {
        if (goal != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Goal Complete"),
              content: Text(
                "Your goal created on ${goal.createdAt.formattedDate} is now complete!",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("NICE"),
                )
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      if (state.fatalError != null) {
        return buildErrorDisplay(state, context);
      }

      return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: const BottomBannerAd(),
          floatingActionButton: const FabRow(),
          drawer: const SideDrawer(),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => showFiltersBottomSheet(context),
                icon: const Icon(kFilterIcon),
              ),
            ],
            title: const Text("Climbing Logbook"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text("Logbook")),
                Tab(icon: Text("Goals")),
                Tab(icon: Text("Projects")),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              LogbookTab(),
              GoalsTab(),
              ProjectsTab(),
            ],
          ),
        ),
      );
    });
  }

  Scaffold buildErrorDisplay(AppState state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Climbing Logbook"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off,
              size: 100.0,
            ),
            Text(
              "A fatal error has occurred:\n${state.fatalError}",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).login();
                context.bloc.add(LogoutEvent());
              },
              child: const Text("Log out"),
            )
          ],
        ),
      ),
    );
  }
}
