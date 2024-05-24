import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

onInitializeDocumentServiceEvent(
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  try {
    final existingUser = await documentService.init();

    // New users should not see whats new screen upon first login
    if (existingUser == null) {
      return;
    }

    final packageInfo = await PackageInfo.fromPlatform();

    if (packageInfo.version != existingUser.installedVersion) {
      Logger.captureInfo("New version detected: ${packageInfo.version}");
      documentService.editCurrentUser(
          existingUser.copyWith(installedVersion: packageInfo.version));
      emit(state().copyWith(newVersionNumber: packageInfo.version));
    }
  } catch (e, s) {
    Logger.captureException(e, s);
    emit(state().copyWith(fatalError: "Application failed to initialize."));
  }
}
