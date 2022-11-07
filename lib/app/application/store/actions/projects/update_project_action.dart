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

class UpdateProjectAction extends ReduxAction<AppState> {
  UpdateProjectAction({
    required this.context,
    required this.id,
    required this.isCompleted,
  });

  final BuildContext context;
  final String id;
  final bool isCompleted;

  @override
  Future<AppState?> reduce() async {
    final LocalDatabase localDatabase = await LocalDatabase.instance;
    IDBFacade<SystemError, ProjectEntity> db = LocalProjectsDB(
      localDatabase: localDatabase,
    );

    final Either<SystemError, bool?> result = await db.update(
      tableName: AppStrings.projectsTableName,
      id: id,
      data: <String, dynamic>{
        'isCompleted': toIntFromBool(isCompleted),
      },
    );

    return result.fold(
      (SystemError error) {
        showNotification(
          context,
          notificationStatus: NotificationStatus.error,
        );
        return state;
      },
      (
        _,
      ) {
        store.dispatch(FetchProjectsAction(context: context));
        Navigator.of(context).pop();
        showNotification(context);

        return state;
      },
    );
  }
}
