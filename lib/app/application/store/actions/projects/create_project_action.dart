import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/projects/fetch_projects_action.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/application/utils/helpers.dart';
import 'package:promodoro/app/domain/constant/enums.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/domain/core/entities/errors/system_error.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';
import 'package:promodoro/app/domain/interfaces/i_db_facade.dart';
import 'package:promodoro/app/infrastructure/repository/local/local_projects_db.dart';
import 'package:promodoro/app/infrastructure/services/local_database.dart';
import 'package:promodoro/app/presentation/routes/routes.dart';

class CreateProjectAction extends ReduxAction<AppState> {
  CreateProjectAction({
    required this.context,
    required this.name,
    required this.minutesPerSession,
    required this.focusSessions,
    required this.shortBreakLength,
    required this.longBreakLength,
    this.shouldNotify = true,
    this.isCompleted = false,
    this.description,
  });

  final BuildContext context;
  final String? description;
  final int focusSessions;
  final bool isCompleted;
  final int longBreakLength;
  final int minutesPerSession;
  final String name;
  final int shortBreakLength;
  final bool shouldNotify;

  @override
  Future<AppState?> reduce() async {
    final ProjectEntity project = ProjectEntity(
      description: description,
      focusSessions: focusSessions,
      isCompleted: isCompleted,
      longBreakLength: longBreakLength,
      minutesPerSession: minutesPerSession,
      name: name,
      shortBreakLength: shortBreakLength,
      shouldNotify: shouldNotify,
    );
    final LocalDatabase localDatabase = await LocalDatabase.instance;
    IDBFacade<SystemError, ProjectEntity> db = LocalProjectsDB(
      localDatabase: localDatabase,
    );

    final Either<SystemError, bool> result = await db.create(
      tableName: AppStrings.projectsTableName,
      data: project.toJson(),
    );

    return result.fold(
      (SystemError error) {
        showNotification(
          context,
          notificationStatus: NotificationStatus.error,
        );
        return state;
      },
      (bool isSuccess) {
        store.dispatch(FetchProjectsAction(context: context));

        Navigator.of(context).pushNamed(
          AppRoutes.dashboardPage,
        );

        showNotification(
          context,
        );
        return state;
      },
    );
  }
}
