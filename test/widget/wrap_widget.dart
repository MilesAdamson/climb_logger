import 'package:climb_logger/services/ad_service.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

Widget wrapWidget(
  Widget child, {
  AppStateBloc? bloc,
}) {
  final adService = MockAdService();

  when(adService.getBannerAd()).thenReturn(BannerAd(
    size: const AdSize(width: 100, height: 50),
    adUnitId: "adUnitId",
    listener: const BannerAdListener(),
    request: const AdRequest(),
  )..load());

  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<AdService>(create: (_) => adService),
    ],
    child: BlocProvider<AppStateBloc>(
      create: (context) => bloc ?? MockBloc(),
      child: MaterialApp(home: child),
    ),
  );
}
