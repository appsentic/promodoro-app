// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectState _$ProjectStateFromJson(Map<String, dynamic> json) {
  return _ProjectState.fromJson(json);
}

/// @nodoc
mixin _$ProjectState {
  List<ProjectEntity>? get projects => throw _privateConstructorUsedError;
  ProjectEntity? get currentProject => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectStateCopyWith<ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res, ProjectState>;
  @useResult
  $Res call({List<ProjectEntity>? projects, ProjectEntity? currentProject});

  $ProjectEntityCopyWith<$Res>? get currentProject;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res, $Val extends ProjectState>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
    Object? currentProject = freezed,
  }) {
    return _then(_value.copyWith(
      projects: freezed == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectEntity>?,
      currentProject: freezed == currentProject
          ? _value.currentProject
          : currentProject // ignore: cast_nullable_to_non_nullable
              as ProjectEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectEntityCopyWith<$Res>? get currentProject {
    if (_value.currentProject == null) {
      return null;
    }

    return $ProjectEntityCopyWith<$Res>(_value.currentProject!, (value) {
      return _then(_value.copyWith(currentProject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProjectStateCopyWith<$Res>
    implements $ProjectStateCopyWith<$Res> {
  factory _$$_ProjectStateCopyWith(
          _$_ProjectState value, $Res Function(_$_ProjectState) then) =
      __$$_ProjectStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProjectEntity>? projects, ProjectEntity? currentProject});

  @override
  $ProjectEntityCopyWith<$Res>? get currentProject;
}

/// @nodoc
class __$$_ProjectStateCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$_ProjectState>
    implements _$$_ProjectStateCopyWith<$Res> {
  __$$_ProjectStateCopyWithImpl(
      _$_ProjectState _value, $Res Function(_$_ProjectState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
    Object? currentProject = freezed,
  }) {
    return _then(_$_ProjectState(
      projects: freezed == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectEntity>?,
      currentProject: freezed == currentProject
          ? _value.currentProject
          : currentProject // ignore: cast_nullable_to_non_nullable
              as ProjectEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectState implements _ProjectState {
  _$_ProjectState({final List<ProjectEntity>? projects, this.currentProject})
      : _projects = projects;

  factory _$_ProjectState.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectStateFromJson(json);

  final List<ProjectEntity>? _projects;
  @override
  List<ProjectEntity>? get projects {
    final value = _projects;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ProjectEntity? currentProject;

  @override
  String toString() {
    return 'ProjectState(projects: $projects, currentProject: $currentProject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProjectState &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.currentProject, currentProject) ||
                other.currentProject == currentProject));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_projects), currentProject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProjectStateCopyWith<_$_ProjectState> get copyWith =>
      __$$_ProjectStateCopyWithImpl<_$_ProjectState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectStateToJson(
      this,
    );
  }
}

abstract class _ProjectState implements ProjectState {
  factory _ProjectState(
      {final List<ProjectEntity>? projects,
      final ProjectEntity? currentProject}) = _$_ProjectState;

  factory _ProjectState.fromJson(Map<String, dynamic> json) =
      _$_ProjectState.fromJson;

  @override
  List<ProjectEntity>? get projects;
  @override
  ProjectEntity? get currentProject;
  @override
  @JsonKey(ignore: true)
  _$$_ProjectStateCopyWith<_$_ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
