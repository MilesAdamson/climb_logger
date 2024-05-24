import 'dart:async';
import 'dart:io';

import 'package:climb_logger/services/logger.dart';
import 'package:collection/collection.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

const kPaidVersionProductId = "paid_version";
const kAlreadyOwnedId = "BillingResponse.itemAlreadyOwned";

class IapService {
  final InAppPurchase _inAppPurchase;
  final _purchasesController = StreamController<PurchaseDetails>();
  late final StreamSubscription<List<PurchaseDetails>> _purchasesMade;

  PurchaseParam? _removeAdsParam;

  Stream<PurchaseDetails> get purchases => _purchasesController.stream;

  IapService(this._inAppPurchase);

  Future<void> init() async {
    final isAvailable = await _inAppPurchase.isAvailable();
    if (isAvailable) {
      await setRemoveAdsParam();
    } else {
      Logger.captureInfo("In app purchases are not available");
    }

    _purchasesMade = _inAppPurchase.purchaseStream.listen((purchases) {
      for (final p in purchases) {
        _purchasesController.add(p);
      }
    });
  }

  Future<void> restorePurchases() => _inAppPurchase.restorePurchases();

  Future<void> dispose() => Future.wait([
        _purchasesMade.cancel(),
      ]);

  Future<void> removeAds() async {
    if (_removeAdsParam == null) {
      await setRemoveAdsParam();
    }

    if (_removeAdsParam == null) {
      throw IapException("Sorry, the product details failed to load. "
          "This could be due to connectivity issues, or an outage with "
          "the ${Platform.isAndroid ? "Google Play Store" : "App Store"}. "
          "Please try again later.");
    }

    try {
      await _inAppPurchase.buyNonConsumable(purchaseParam: _removeAdsParam!);
    } catch (e, s) {
      Logger.captureException(e, s);
      throw IapException("An unknown error occurred");
    }
  }

  Future<void> verifyPurchase(PurchaseDetails purchaseDetails) =>
      _inAppPurchase.completePurchase(purchaseDetails);

  Future<void> setRemoveAdsParam() async {
    final details =
        await _inAppPurchase.queryProductDetails({kPaidVersionProductId});
    final removeAds = details.productDetails
        .firstWhereOrNull((element) => element.id == kPaidVersionProductId);

    if (removeAds != null) {
      _removeAdsParam = PurchaseParam(productDetails: removeAds);
    } else {
      Logger.captureException(
          "$kPaidVersionProductId was not found in product details", null);
    }
  }
}

class IapException {
  final String message;

  IapException(this.message);
}
