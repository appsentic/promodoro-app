// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectState _$$_ProjectStateFromJson(Map<String, dynamic> json) =>
    _$_ProjectState(
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => ProjectEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentProject: json['currentProject'] == null
          ? null
          : ProjectEntity.fromJson(
              json['currentProject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProjectStateToJson(_$_ProjectState instance) =>
    <String, dynamic>{
      'projects': instance.projects,
      'currentProject': instance.currentProject,
    };
