import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';

class ProcessLifecycleChangeAction extends ReduxAction<AppState> {
  final AppLifecycleState lifecycle;
  ProcessLifecycleChangeAction(this.lifecycle);

  @override
  Future<AppState?> reduce() async {
    if (lifecycle == AppLifecycleState.resumed ||
        lifecycle == AppLifecycleState.inactive) {
      store.resumePersistor();
    } else if (lifecycle == AppLifecycleState.paused ||
        lifecycle == AppLifecycleState.detached) {
      store.persistAndPausePersistor();
    } else
      throw AssertionError(lifecycle);

    return null;
  }
}
