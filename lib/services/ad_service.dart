import 'dart:async';
import 'dart:io';

import 'package:climb_logger/services/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const kAndroidAppId = "";
const kIosAppId = "";

const kAndroidBannerUnitId = "";
const kIosBannerUnitId = "";

const kAndroidInterstitialUnitId = "";
const kIosInterstitialUnitId = "";

const kTestDeviceId = "";

class AdService {
  final MobileAds _mobileAds;

  AdService(this._mobileAds);

  Future<void> init() async {
    await _mobileAds.initialize();
    if (kDebugMode) {
      final cfg = RequestConfiguration(testDeviceIds: [kTestDeviceId]);
      await MobileAds.instance.updateRequestConfiguration(cfg);
    }
  }

  BannerAd getBannerAd() {
    return BannerAd(
      adUnitId: _bannerUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          Logger.captureInfo("New banner ad loaded");
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
          Logger.captureInfo("Ad error: $error");
        },
      ),
    )..load();
  }

  Future<void> showAd() async {
    final adCompleter = Completer<InterstitialAd?>();
    final adClosedCompleter = Completer<void>();

    await InterstitialAd.load(
      adUnitId: _interstitialUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Logger.captureInfo("Ad Dismissed");
              adClosedCompleter.complete();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              Logger.captureException(error, null);
              adClosedCompleter.complete();
            },
          );

          adCompleter.complete(ad);
        },
        onAdFailedToLoad: (error) {
          Logger.captureInfo('InterstitialAd failed to load: $error');
          adCompleter.complete();
        },
      ),
    );

    final ad = await adCompleter.future;

    if (ad != null) {
      await ad.show();
      await adClosedCompleter.future;
    }
  }

  String get _bannerUnitId {
    if (kDebugMode) {
      return BannerAd.testAdUnitId;
    }

    if (Platform.isAndroid) {
      return kAndroidBannerUnitId;
    }

    if (Platform.isIOS) {
      return kIosBannerUnitId;
    }

    throw UnimplementedError(
        "${Platform.operatingSystem} is not implemented for banner ads");
  }

  String get _interstitialUnitId {
    if (kDebugMode) {
      return InterstitialAd.testAdUnitId;
    }

    if (Platform.isAndroid) {
      return kAndroidInterstitialUnitId;
    }

    if (Platform.isIOS) {
      return kIosInterstitialUnitId;
    }

    throw UnimplementedError(
        "${Platform.operatingSystem} is not implemented for interstitial ads");
  }
}
