import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateBuilder extends StatelessWidget {
  final BlocWidgetBuilder<AppState> builder;
  final BlocBuilderCondition<AppState>? buildWhen;

  const StateBuilder({
    Key? key,
    required this.builder,
    this.buildWhen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppState>(
      builder: builder,
      buildWhen: buildWhen,
    );
  }
}
