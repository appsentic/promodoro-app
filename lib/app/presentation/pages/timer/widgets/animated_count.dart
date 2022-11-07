import 'package:flutter/material.dart';
import 'package:promodoro/app/presentation/theme/colors.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  const AnimatedCount({
    required this.count,
    required Duration duration,
    Curve curve = Curves.linear,
    Key? key,
  }) : super(
          duration: duration,
          curve: curve,
          key: key,
        );

  final int count;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween? _count;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _count = visitor(
      _count,
      widget.count,
      (dynamic value) => IntTween(begin: value as int),
    )! as IntTween;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: _count!.evaluate(animation).toString(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.primaryDarkColor,
                ),
          ),
        ],
      ),
    );
  }
}
