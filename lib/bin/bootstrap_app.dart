import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/infrastructure/services/local_database.dart';
import 'package:promodoro/bin/lifecycle/app_lifecycle_manager.dart';
import 'package:promodoro/bin/notifications/setup_notifications.dart';
import 'package:promodoro/bin/promodoro_app.dart';

void bootstrapApp({
  AppContext? appContext = AppContext.development,
  Store<AppState>? store,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.initializeDb();

  SetupNotifications setupNotifications = SetupNotifications();
  await setupNotifications.init();

  // Lock to portrait mode
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  Store<AppState> appStore = store ??= Store<AppState>(
    initialState: AppState.initial().copyWith(),
  );

  runApp(
    AppLifecycleManager(
      store: appStore,
      child: PromodoroApp(
        store: appStore,
        appContext: appContext,
      ),
    ),
  );
}
