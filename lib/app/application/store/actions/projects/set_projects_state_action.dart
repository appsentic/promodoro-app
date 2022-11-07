
import 'package:async_redux/async_redux.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/application/store/states/projects/project_state.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';

class SetProjectsStateAction extends ReduxAction<AppState> {
  SetProjectsStateAction({
    this.listOfProjects,
    this.currentProject,
  });

  final ProjectEntity? currentProject;
  final List<ProjectEntity>? listOfProjects;

  @override
  AppState? reduce() {
    final ProjectState? oldState = state.projectState;

    return state.copyWith.projectState?.call(
      currentProject: currentProject ?? oldState?.currentProject,
      projects: listOfProjects ?? oldState?.projects,
    );
  }
}
