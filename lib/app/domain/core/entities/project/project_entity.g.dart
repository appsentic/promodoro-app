// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectEntity _$$_ProjectEntityFromJson(Map<String, dynamic> json) =>
    _$_ProjectEntity(
      id: json['id'],
      name: json['name'] as String?,
      description: json['description'] as String?,
      minutesPerSession: json['minutesPerSession'] as int?,
      focusSessions: json['focusSessions'] as int?,
      shortBreakLength: json['shortBreakLength'] as int?,
      longBreakLength: json['longBreakLength'] as int?,
      isCompleted: parseBool(json['isCompleted'] as int),
      shouldNotify: parseBool(json['shouldNotify'] as int),
    );

Map<String, dynamic> _$$_ProjectEntityToJson(_$_ProjectEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'minutesPerSession': instance.minutesPerSession,
      'focusSessions': instance.focusSessions,
      'shortBreakLength': instance.shortBreakLength,
      'longBreakLength': instance.longBreakLength,
      'isCompleted': toIntFromBool(instance.isCompleted),
      'shouldNotify': toIntFromBool(instance.shouldNotify),
    };
