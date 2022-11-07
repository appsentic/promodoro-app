// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:promodoro/app/application/utils/helpers.dart';

part 'project_entity.freezed.dart';
part 'project_entity.g.dart';

@freezed
class ProjectEntity with _$ProjectEntity {
  factory ProjectEntity({
    dynamic id,
    String? name,
    String? description,
    int? minutesPerSession,
    int? focusSessions,
    int? shortBreakLength,
    int? longBreakLength,
    @JsonKey(fromJson: parseBool, toJson: toIntFromBool) bool? isCompleted,
    @JsonKey(fromJson: parseBool, toJson: toIntFromBool) bool? shouldNotify,
  }) = _ProjectEntity;

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);

  factory ProjectEntity.initial() => ProjectEntity(
        id: null,
        name: null,
        description: null,
        focusSessions: null,
        longBreakLength: null,
        shortBreakLength: null,
        minutesPerSession: null,
        shouldNotify: true,
        isCompleted: false,
      );
}
