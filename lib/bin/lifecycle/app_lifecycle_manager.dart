import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/lifecycle/process_lifecycle_change_action.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';

class AppLifecycleManager extends StatefulWidget {
  const AppLifecycleManager({
    required this.child,
    required this.store,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Store<AppState> store;

  _AppLifecycleManagerState createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState lifecycle) {
    widget.store.dispatch(ProcessLifecycleChangeAction(lifecycle));
  }

  Widget build(BuildContext context) => widget.child;
}
