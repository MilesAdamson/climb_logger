import 'package:climb_logger/services/auth_service.dart';
import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

onPurchaseDetailsEvent(
  PurchaseMadeEvent event,
  StateGetter state,
  Emitter<AppState> emit,
  IapService iapService,
  DocumentService documentService,
  AuthService authService,
) async {
  final details = event.purchaseDetails;
  final uid = await authService.getUidAsync();

  if (event.purchaseDetails.error?.message == kAlreadyOwnedId) {
    documentService.setCurrentUserAsPaid(uid);
    iapService.verifyPurchase(details);
    return;
  }

  if (event.purchaseDetails.productID != kPaidVersionProductId) {
    throw UnimplementedError(
        "${event.purchaseDetails.productID} is not implemented");
  }

  if (details.pendingCompletePurchase) {
    iapService.verifyPurchase(details);
    Logger.captureInfo(
        "Purchase status of ${details.status} has been completed");
  }

  final userShouldBeSetAsPaid = details.status == PurchaseStatus.purchased ||
      details.status == PurchaseStatus.restored;

  if (userShouldBeSetAsPaid) {
    documentService.setCurrentUserAsPaid(uid);
  }
}
