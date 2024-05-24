import 'dart:async';
import 'dart:io';

import 'package:climb_logger/components/app_icon.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/components/version_label.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late final StreamSubscription _loginSubscription;
  late final bloc = context.bloc;

  @override
  void initState() {
    _loginSubscription = context.bloc.stream
        .map((appState) => appState.isLoggedIn)
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        _loginSubscription.cancel();
        Navigator.of(context).home();
      }
    });
    bloc.add(StartStatsSubscriptionEvent());
    super.initState();
  }

  @override
  void dispose() {
    _loginSubscription.cancel();
    bloc.add(StopStatsSubscriptionEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Text(
                "Climbing Logbook",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                    "${state.statsModel.logbookCount} climbs logged worldwide"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Column(
                  children: const [
                    AppIcon(),
                    VersionLabel(showAppName: false),
                  ],
                ),
              ),
              if (state.loginError != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    state.loginError!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    signInWithGoogleButton(context),
                    if (Platform.isIOS)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: SignInWithAppleButton(
                            height: 50.0,
                            style: SignInWithAppleButtonStyle.white,
                            onPressed: () {
                              context.bloc.add(LoginWithAppleEvent());
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Climbing Logbook uses Google Sign In for authentication, "
                  "but does not collect any personal information about its users.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget signInWithGoogleButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.bloc.add(LoginWithGoogleEvent());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/google_icon.png',
              height: 30.0,
              width: 30.0,
            ),
            const SizedBox(width: 16.0),
            const Text("Sign in with Google"),
          ],
        ),
      ),
    );
  }
}
