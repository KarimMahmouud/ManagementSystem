// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      id: json['id'],
      assign_from: json['assign_from'],
      attachment: json['attachment'],
      title: json['title'],
      description: json['description'],
      assign_user: json['assign_user'],
      end_time: json['end_time'],
      start_time: json['start_time'],
      assign_department: json['assign_department'],
      assign_status: json['assign_status'],
    );

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'id': instance.id,
      'assign_from': instance.assign_from,
      'assign_user': instance.assign_user,
      'attachment': instance.attachment,
      'assign_department': instance.assign_department,
      'assign_status': instance.assign_status,
      'title': instance.title,
      'description': instance.description,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };
