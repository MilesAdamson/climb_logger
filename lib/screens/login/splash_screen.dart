import 'dart:async';

import 'package:climb_logger/components/loading_bars.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  StreamSubscription? loginSubscription;

  @override
  void initState() {
    context.bloc.add(AppStartupEvent());
    loginSubscription = context.bloc.stream.listen((appState) {
      if (appState.appStartupHasRan) {
        loginSubscription!.cancel();
        appState.isLoggedIn
            ? Navigator.of(context).home()
            : Navigator.of(context).login();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoadingBars(),
      ),
    );
  }
}
