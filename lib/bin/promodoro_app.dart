import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/presentation/routes/route_generator.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';
import 'package:promodoro/app/presentation/theme/colors.dart';
import 'package:promodoro/app/presentation/theme/themes.dart';

class PromodoroApp extends StatefulWidget {
  const PromodoroApp({
    required this.store,
    super.key,
    this.appContext = AppContext.development,
  });

  final Store<AppState> store;
  final AppContext? appContext;

  @override
  State<PromodoroApp> createState() => _PromodoroAppState();
}

class _PromodoroAppState extends State<PromodoroApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: kDebugMode,
        title: AppStrings.appTitle,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: widget.store.state.themeMode,
        color: AppColors.primaryGreenColor,
        initialRoute: AppRoutes.dashboardPage,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
