import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';

class ThemeViewModel {
  ThemeViewModel({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  static ThemeViewModel fromStore(Store<AppState> store) {
    return ThemeViewModel(
      themeMode: store.state.themeMode ?? ThemeMode.system,
    );
  }
}
