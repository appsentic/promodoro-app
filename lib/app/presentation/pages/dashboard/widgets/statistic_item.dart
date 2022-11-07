import 'package:flutter/material.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/presentation/theme/colors.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    required this.count,
    required this.title,
    this.isCompleted = true,
    super.key,
  });

  final int count;
  final bool isCompleted;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SpaceUtils.commonSpace,
        vertical: SpaceUtils.commonSpace,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SpaceUtils.smallSpace,
        ),
        color: isCompleted ? AppColors.primaryGreenColor : AppColors.errorColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.primaryDarkColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryLightColor,
                ),
          ),
          const SizedBox(
            height: SpaceUtils.smallSpace,
          ),
          Text(
            count.toString(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
