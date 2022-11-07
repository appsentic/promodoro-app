import 'package:flutter/material.dart';
import 'package:promodoro/app/application/utils/space_utils.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/presentation/theme/colors.dart';

Map<String, dynamic> mapAllBoolToInt(Map<String, dynamic> data) {
  return data.map(
    (String key, dynamic value) {
      dynamic val = value;
      if (value is bool) {
        val = value == true ? 1 : 0;
      }
      return MapEntry<String, dynamic>(
        key,
        val,
      );
    },
  );
}

bool parseBool(int integer) {
  return integer == 1;
}

int toIntFromBool(bool? value) {
  if (value == null) {
    return 0;
  }
  ;
  if (value) {
    return 1;
  } else {
    return 0;
  }
}

void showNotification(
  BuildContext context, {
  NotificationStatus notificationStatus = NotificationStatus.success,
  String message = AppStrings.genericSuccess,
}) {
  Color getNotificationColor() {
    switch (notificationStatus) {
      case NotificationStatus.success:
        return AppColors.primaryGreenColor;
      case NotificationStatus.warning:
        return AppColors.warningColor;
      case NotificationStatus.error:
        return AppColors.errorColor;
      default:
        return AppColors.primaryGreenColor;
    }
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: SpaceUtils.commonSpace),
        padding: const EdgeInsets.symmetric(
          horizontal: SpaceUtils.commonSpace,
          vertical: SpaceUtils.commonSpace,
        ),
        decoration: BoxDecoration(
          color: getNotificationColor(),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
