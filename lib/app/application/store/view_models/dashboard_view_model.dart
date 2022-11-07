import 'package:async_redux/async_redux.dart';
import 'package:promodoro/app/application/store/states/app_state.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';

class DashboardViewModel {
  DashboardViewModel({
    required this.projects,
  });

  final List<ProjectEntity> projects;

  static DashboardViewModel fromStore(Store<AppState> store) {
    return DashboardViewModel(
      projects: store.state.projectState?.projects ?? <ProjectEntity>[],
    );
  }
}
