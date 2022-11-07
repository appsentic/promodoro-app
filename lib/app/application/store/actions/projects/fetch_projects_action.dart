import 'dart:async';
import 'dart:developer';

import 'package:async_redux/async_redux.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/projects/set_projects_state_action.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/domain/constant/strings.dart';
import 'package:promodoro/app/domain/core/entities/errors/system_error.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';
import 'package:promodoro/app/domain/interfaces/i_db_facade.dart';
import 'package:promodoro/app/infrastructure/repository/local/local_projects_db.dart';
import 'package:promodoro/app/infrastructure/services/local_database.dart';

class FetchProjectsAction extends ReduxAction<AppState> {
  FetchProjectsAction({
    required this.context,
  });

  final BuildContext context;

  @override
  Future<AppState?> reduce() async {
    final LocalDatabase localDatabase = await LocalDatabase.instance;
    IDBFacade<SystemError, ProjectEntity> db = LocalProjectsDB(
      localDatabase: localDatabase,
    );

    final Either<SystemError, List<ProjectEntity>?> result = await db.findAll(
      tableName: AppStrings.projectsTableName,
    );

    return result.fold(
      (SystemError error) {
        log('Error: $error');

        return state;
      },
      (
        List<ProjectEntity>? projects,
      ) {
        store.dispatch(
          SetProjectsStateAction(
            listOfProjects: projects,
          ),
        );

        return state;
      },
    );
  }
}
