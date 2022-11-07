// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'dart:developer';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:promodoro/app/application/store/states/projects/project_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    ProjectState? projectState,
    ThemeMode? themeMode,
    // ignore: invalid_annotation_target
    @JsonKey(ignore: true) Wait? wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        projectState: ProjectState.initial(),
        themeMode: ThemeMode.system,
        wait: Wait(),
      );
}

extension AppStateExt on AppState {
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{
      'projectState': jsonEncode(projectState),
      'themeMode': jsonEncode(themeMode?.name),
    };

    log('AppState data: $map');

    return map;
  }
}

AppState toAppState(Map<String, dynamic> data) {
  log('Map data: $data');
  return AppState(
    projectState: ProjectState.fromJson(
        jsonDecode(data['projectState'] as String) as Map<String, dynamic>),
    themeMode: ThemeMode.values
        .where((ThemeMode mode) =>
            mode.name == jsonDecode(data['projectState'] as String))
        .first,
  );
}
