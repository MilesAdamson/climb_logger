import 'dart:async';

import 'package:climb_logger/models/goal_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/services/ad_service.dart';
import 'package:climb_logger/services/iap_service.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:climb_logger/state/events.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BuildContextExtensions on BuildContext {
  AppStateBloc get bloc => read<AppStateBloc>();

  AdService get adService => RepositoryProvider.of<AdService>(this);

  IapService get iapService => RepositoryProvider.of<IapService>(this);

  Future<String> createProject(ProjectModel project) async {
    final existingIds = bloc.state.projectMap.keys;
    late StreamSubscription s;
    final completer = Completer<String>();

    s = bloc.stream.map((state) => state.projectMap.keys).listen((keys) {
      final newId = keys.firstWhereOrNull((id) => !existingIds.contains(id));
      if (newId != null) {
        completer.complete(newId);
        s.cancel();
      }
    });

    bloc.add(CreateProjectEvent(project));

    return completer.future;
  }

  Future<String> createGoal(GoalModel goal) async {
    final existingIds = bloc.state.goalMap.keys;
    late StreamSubscription s;
    final completer = Completer<String>();

    s = bloc.stream.map((state) => state.goalMap.keys).listen((keys) {
      final newId = keys.firstWhereOrNull((id) => !existingIds.contains(id));
      if (newId != null) {
        completer.complete(newId);
        s.cancel();
      }
    });

    bloc.add(CreateGoalEvent(goal));

    return completer.future;
  }

  Future<String> createHangboardRoutine(HangboardRoutineModel routine) async {
    final existingIds = bloc.state.hangboardRoutineMap.keys;
    late StreamSubscription s;
    final completer = Completer<String>();

    s = bloc.stream
        .map((state) => state.hangboardRoutineMap.keys)
        .listen((keys) {
      final newId = keys.firstWhereOrNull((id) => !existingIds.contains(id));
      if (newId != null) {
        completer.complete(newId);
        s.cancel();
      }
    });

    bloc.add(CreateHangboardRoutineEvent(routine));

    return completer.future;
  }
}
