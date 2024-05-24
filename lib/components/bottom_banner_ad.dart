import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomBannerAd extends StatefulWidget {
  const BottomBannerAd({Key? key}) : super(key: key);

  @override
  State<BottomBannerAd> createState() => _BottomBannerAdState();
}

class _BottomBannerAdState extends State<BottomBannerAd> {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      if (state.shouldShowAds) {
        return _Banner();
      }

      return const SizedBox.shrink();
    });
  }
}

class _Banner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BannerState();
}

class _BannerState extends State<_Banner> {
  BannerAd? banner;

  @override
  void initState() {
    banner = context.adService.getBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        height: banner!.size.height.toDouble(),
        width: MediaQuery.of(context).size.width,
        child: Container(
          alignment: Alignment.center,
          child: AdWidget(ad: banner!),
          width: banner!.size.width.toDouble(),
          height: banner!.size.height.toDouble(),
        ),
      ),
    );
  }
}
