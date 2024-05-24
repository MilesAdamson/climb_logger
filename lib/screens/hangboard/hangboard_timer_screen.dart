import 'dart:async';

import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/hangboarding/hangboard_timer_list_tile.dart';
import 'package:climb_logger/components/hangboarding/mute_timer_button.dart';
import 'package:climb_logger/components/hangboarding/timer_bottom_panel.dart';
import 'package:climb_logger/models/hangboard_entry_model.dart';
import 'package:climb_logger/models/hangboard_item_model.dart';
import 'package:climb_logger/models/hangboard_routine_model.dart';
import 'package:climb_logger/services/sound_service.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/theme/app_color.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/timer/hangboard_timer.dart';
import 'package:climb_logger/util/timer/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';

class HangboardTimerScreen extends StatefulWidget {
  final HangboardRoutineModel hangboardRoutine;

  const HangboardTimerScreen({
    Key? key,
    required this.hangboardRoutine,
  }) : super(key: key);

  @override
  State<HangboardTimerScreen> createState() => HangboardTimerScreenState();
}

class HangboardTimerScreenState extends State<HangboardTimerScreen> {
  late final HangboardTimer timer = HangboardTimer(
    widget.hangboardRoutine,
    RepositoryProvider.of<SoundService>(context),
  );

  late final restColor = context.bloc.state.settings.colorFour;
  late final hangColor = context.bloc.state.settings.colorFive;
  late final StreamSubscription timerSubscription;
  late final StreamSubscription workoutCompletedSubscription;
  late List<HangboardItemModel> workoutCopy;

  var listKey = GlobalKey<AnimatedListState>();

  @override
  initState() {
    Wakelock.enable();
    setupTimerSubscription();
    setupWorkoutCompletedSubscription();
    super.initState();
  }

  void setupWorkoutCompletedSubscription() {
    workoutCompletedSubscription = timer.stream
        .map((state) => state.status)
        .distinct()
        .listen((status) async {
      if (status == TimerStatus.done) {
        final confirm = await showConfirmationDialog(
          context,
          title: "Workout Complete",
          message: "Press OK to save a logbook entry and exit the timer",
        );

        if (confirm) {
          Navigator.pop(context);
          Navigator.pop(context);
          addHangboardEntry(context);
        }
      }
    });
  }

  void setupTimerSubscription() {
    timerSubscription =
        timer.stream.map((state) => state.index).distinct().listen((i) {
      if (i == 0) {
        setState(() {
          workoutCopy =
              timer.workout.map((item) => item.copyWithNewUniqueId()).toList();
          listKey = GlobalKey<AnimatedListState>();
        });
      } else {
        final item = workoutCopy.first;
        setState(() {
          listKey.currentState!.removeItem(
            0,
            (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: HangboardTimerListTile(
                item: item,
                isBig: false,
                isColored: false,
              ),
            ),
            duration: kTimerAnimationDuration,
          );
          workoutCopy.removeAt(0);
        });
      }
    });
  }

  @override
  void dispose() {
    Wakelock.disable();
    workoutCompletedSubscription.cancel();
    timerSubscription.cancel();
    timer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TimerState>(
      stream: timer.stream,
      builder: (context, snapshot) {
        final timerState = snapshot.data;

        if (timerState == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Timer"),
            ),
          );
        }

        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        late final Widget screenBody;
        if (isLandscape) {
          screenBody = Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: buildItemList(),
                ),
              ),
              Flexible(
                flex: 1,
                child: TimerBottomPanel(
                  isLandscape: isLandscape,
                  restColor: restColor,
                  hangColor: hangColor,
                  timer: timer,
                  timerState: timerState,
                ),
              ),
            ],
          );
        } else {
          screenBody = Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: buildItemList()),
              TimerBottomPanel(
                isLandscape: isLandscape,
                restColor: restColor,
                hangColor: hangColor,
                timer: timer,
                timerState: timerState,
              ),
            ],
          );
        }

        return Scaffold(
          backgroundColor: AppColor.darkBg,
          appBar: isLandscape ? null : buildAppBar(),
          body: screenBody,
        );
      },
    );
  }

  Widget buildItemList() {
    return AnimatedList(
      key: listKey,
      initialItemCount: workoutCopy.length,
      itemBuilder: (context, index, animation) {
        final item = workoutCopy[index];
        return HangboardTimerListTile(
          key: Key(index.toString()),
          item: item,
          isBig: index < 2,
          isColored: index == 0,
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Timer"),
      actions: [
        const MuteTimerButton(),
        buildCheckMarkButton(),
      ],
    );
  }

  IconButton buildCheckMarkButton() {
    return IconButton(
      onPressed: () async {
        final confirm = await showConfirmationDialog(
          context,
          title: "Mark as Completed",
          message: "This will add a logbook entry for"
              " ${widget.hangboardRoutine.name} and exit the timer.",
        );

        if (confirm) {
          Navigator.pop(context);
          addHangboardEntry(context);
        }
      },
      icon: const Icon(Icons.check),
    );
  }

  void addHangboardEntry(BuildContext context) {
    context.bloc.add(HangboardRoutineCompletedEvent(HangboardEntryModel(
      widget.hangboardRoutine,
      DateTime.now(),
    )));
  }
}
