import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:promodoro/app/application/store/actions/projects/create_project_action.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';

class ProjectsViewModel {
  ProjectsViewModel({
    required this.projects,
    required this.currentProject,
    required this.createProject,
  });

  final Function({
    required BuildContext context,
    required int focusSessions,
    required int longBreakLength,
    required int minutesPerSession,
    required String name,
    required int shortBreakLength,
    bool? shouldNotify,
    String? description,
    bool? isCompleted,
  }) createProject;

  final ProjectEntity? currentProject;
  final List<ProjectEntity> projects;

  static ProjectsViewModel fromStore(Store<AppState> store) {
    return ProjectsViewModel(
      projects: store.state.projectState?.projects ?? <ProjectEntity>[],
      currentProject: store.state.projectState?.currentProject,
      createProject: ({
        required BuildContext context,
        required int focusSessions,
        required int longBreakLength,
        required int minutesPerSession,
        required String name,
        required int shortBreakLength,
        bool? shouldNotify,
        String? description,
        bool? isCompleted,
      }) {
        store.dispatch(
          CreateProjectAction(
            context: context,
            name: name,
            description: description,
            isCompleted: isCompleted ?? false,
            shouldNotify: shouldNotify ?? true,
            minutesPerSession: minutesPerSession,
            focusSessions: focusSessions,
            shortBreakLength: shortBreakLength,
            longBreakLength: longBreakLength,
          ),
        );
      },
    );
  }
}
