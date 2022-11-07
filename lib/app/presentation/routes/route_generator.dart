import 'package:flutter/cupertino.dart';
import 'package:promodoro/app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:promodoro/app/presentation/pages/introduction_page.dart';
import 'package:promodoro/app/presentation/pages/project/create_project_page.dart';
import 'package:promodoro/app/presentation/pages/timer/focus_page.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final dynamic args = settings.arguments;

  switch (settings.name) {
    case AppRoutes.dashboardPage:
      return CupertinoPageRoute<DashboardPage>(
        builder: (_) => const DashboardPage(),
      );

    case AppRoutes.introductionPage:
      return CupertinoPageRoute<IntroductionPage>(
        builder: (_) => const IntroductionPage(),
      );

    case AppRoutes.createProjectPage:
      return CupertinoPageRoute<CreateProjectPage>(
        builder: (_) => const CreateProjectPage(),
      );

    case AppRoutes.focusPage:
      return CupertinoPageRoute<FocusPage>(
        builder: (_) => const FocusPage(),
      );

    default:
      return CupertinoPageRoute<IntroductionPage>(
        builder: (_) => const IntroductionPage(),
      );
  }
}
