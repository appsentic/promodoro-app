// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:promodoro/app/domain/core/entities/project/project_entity.dart';

part 'project_state.freezed.dart';
part 'project_state.g.dart';

@freezed
class ProjectState with _$ProjectState {
  factory ProjectState({
    List<ProjectEntity>? projects,
    ProjectEntity? currentProject,
  }) = _ProjectState;

  factory ProjectState.fromJson(Map<String, dynamic> json) =>
      _$ProjectStateFromJson(json);

  factory ProjectState.initial() => ProjectState(
        projects: <ProjectEntity>[],
        currentProject: null,
      );
}
