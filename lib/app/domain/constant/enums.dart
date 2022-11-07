import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppContext {
  development,
  testing,
  production,
}

enum ButtonVariant {
  filled,
  outline,
}

extension ThemeModeExt on ThemeMode {
  String get name {
    return describeEnum(this);
  }
}

enum ErrorType {
  databaseError,
  formatError,
  unknown,
}

enum NotificationStatus {
  success,
  error,
  warning,
  unknown,
}
