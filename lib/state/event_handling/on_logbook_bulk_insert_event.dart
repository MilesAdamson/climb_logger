import 'dart:async';

import 'package:climb_logger/services/document_service.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onLogbookBulkInsertEvent(
  LogbookBulkInsertEvent event,
  StateGetter state,
  Emitter<AppState> emit,
  DocumentService documentService,
) async {
  final completer = Completer();
  late final StreamSubscription s;

  s = documentService.bulkInsertLogbookEntry(event.entries).listen((count) {
    emit(state().copyWith(bulkInsertProgress: count));

    if (count == event.entries.length) {
      s.cancel();
      emit(state().copyWith(bulkInsertComplete: true));
      completer.complete();
    }
  });

  await completer.future;
  emit(state().copyWith(bulkInsertComplete: false, bulkInsertProgress: 0));
}
