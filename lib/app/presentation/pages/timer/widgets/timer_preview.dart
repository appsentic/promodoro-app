import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/projects/update_project_action.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';
import 'package:promodoro/app/presentation/theme/colors.dart';
import 'package:promodoro/bin/notifications/setup_notifications.dart';

class TimerPreview extends StatefulWidget {
  const TimerPreview({
    required this.project,
    this.onBreak,
    this.setOnBreak,
    this.cancelTimer,
    super.key,
  });

  final ProjectEntity project;
  final Function(bool isBreak)? onBreak;
  final Function(Timer? timer)? setOnBreak;
  final Function(Timer? timer)? cancelTimer;

  @override
  State<TimerPreview> createState() => _TimerPreviewState();
}

class _TimerPreviewState extends State<TimerPreview>
    with TickerProviderStateMixin {
  int currentRound = 1;
  bool isBreak = false;
  late int timeout;
  // timer approach
  Timer? countdownTimer;
  late Duration sessionDuration;
  SetupNotifications setupNotifications = SetupNotifications();

  @override
  void initState() {
    timeout = widget.project.minutesPerSession ?? 25;

    // timer approach
    sessionDuration = Duration(minutes: timeout);
    startTimer();
    super.initState();
  }

  void countDownTime() {
    const int reduceSecondsBy = 1;
    setState(() {
      final int seconds = sessionDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        stopTimer();

        if (currentRound >= (widget.project.focusSessions ?? 4)) {
          stopTimer();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setupNotifications.showNotification(
              title: AppStrings.congratsText,
              body: AppStrings.congratsDescText,
            );
            StoreProvider.dispatch(
              context,
              UpdateProjectAction(
                context: context,
                id: widget.project.id.toString(),
                isCompleted: true,
              ),
            );
          });
          return;
        }

        if (isBreak) {
          resetTimer();
          isBreak = false;
          widget.onBreak?.call(false);
        } else {
          setBreaks();
          isBreak = true;
          widget.onBreak?.call(true);
        }
        startTimer();
      } else {
        sessionDuration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => countDownTime(),
    );
  }

  void resetTimer() {
    stopTimer();
    sessionDuration = Duration(minutes: timeout);
    currentRound += 1;
  }

  void setBreaks() {
    bool takeShortBreak = currentRound % 2 == 0;

    if (takeShortBreak) {
      setShortBreak();
    } else {
      setLongBreak();
    }
  }

  void setShortBreak() {
    stopTimer();
    sessionDuration = Duration(
      minutes: widget.project.shortBreakLength ?? 5,
    );
  }

  void setLongBreak() {
    stopTimer();
    sessionDuration = Duration(
      minutes: widget.project.longBreakLength ?? 20,
    );
    setupNotifications.showNotification(
      title: AppStrings.breakTitle,
      body: AppStrings.breakDesc(widget.project.longBreakLength ?? 5),
    );
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  String getTimeRemaining() {
    final String minutes = strDigits(sessionDuration.inMinutes.remainder(60));
    final String seconds = strDigits(sessionDuration.inSeconds.remainder(60));

    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      padding: const EdgeInsets.all(SpaceUtils.largeSpace),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.subtleGreenColor.withOpacity(0.4),
      ),
      child: AnimatedContainer(
        duration: kThemeAnimationDuration,
        padding: const EdgeInsets.all(SpaceUtils.largeSpace),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.subtleGreenColor.withOpacity(0.8),
        ),
        width: MediaQuery.of(context).size.width,
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          padding: const EdgeInsets.all(SpaceUtils.largeSpace),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.subtleGreenColor,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: SpaceUtils.verySmallSpace),
              Text(
                widget.project.name ?? AppStrings.noProjectText,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: SpaceUtils.verySmallSpace),
              Text(
                widget.project.description ?? AppStrings.noProjectDescText,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryDarkColor,
                    ),
              ),
              Text(
                getTimeRemaining(),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.primaryDarkColor,
                    ),
              ),
              const SizedBox(height: SpaceUtils.commonSpace),
              Text(
                isBreak
                    ? AppStrings.takeABreak
                    : AppStrings.getRoundsText(
                        round: currentRound,
                        totalRounds: widget.project.focusSessions ?? 1,
                      ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryDarkColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
