import 'package:climb_logger/routing/app_navigator.dart';
import 'package:climb_logger/services/ad_service.dart';
import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/services/sound_service.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Logger.init();

  final appNavigator = AppNavigator();
  await Firebase.initializeApp();

  final authService = AuthService(
    GoogleSignIn(),
    FirebaseAuth.instance,
  );

  final adService = AdService(MobileAds.instance);

  final documentService = DocumentService(
    FirebaseFirestore.instance,
    () => authService.uid,
  );

  final iapService = IapService(InAppPurchase.instance);

  final bloc = AppStateBloc(
    authService,
    documentService,
    adService,
    iapService,
  );

  final soundService = SoundService(bloc);

  runApp(MyApp(
    appNavigator: appNavigator,
    bloc: bloc,
    adService: adService,
    iapService: iapService,
    soundService: soundService,
  ));
}

class MyApp extends StatelessWidget {
  final AppNavigator appNavigator;
  final AppStateBloc bloc;
  final AdService adService;
  final IapService iapService;
  final SoundService soundService;

  const MyApp({
    Key? key,
    required this.appNavigator,
    required this.bloc,
    required this.adService,
    required this.iapService,
    required this.soundService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AdService>(create: (_) => adService),
        RepositoryProvider<IapService>(create: (_) => iapService),
        RepositoryProvider<SoundService>(create: (_) => soundService),
      ],
      child: BlocProvider<AppStateBloc>(
        create: (_) => bloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppNavigator.splash,
          onGenerateRoute: appNavigator.onGenerateRoute,
          onUnknownRoute: (route) {
            Logger.captureException("${route.name} not found", null);
            return null;
          },
          title: 'Climb Logger',
          theme: AppTheme().themeData,
        ),
      ),
    );
  }
}
