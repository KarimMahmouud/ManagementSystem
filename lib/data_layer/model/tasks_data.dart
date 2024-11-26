import 'package:json_annotation/json_annotation.dart';

part 'tasks_data.g.dart';

@JsonSerializable()
class Tasks {
  Tasks({
    this.id,
    this.assign_from,
    this.attachment,
    this.title,
    this.description,
    this.assign_user,
    this.end_time,
    this.start_time,
    this.assign_department,
    this.assign_status,
  });

  dynamic id;
  dynamic assign_from;
  dynamic assign_user;
  dynamic attachment;
  dynamic assign_department;
  dynamic assign_status;
  dynamic title;
  dynamic description;
  dynamic start_time;
  dynamic end_time;

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
  Map<String, dynamic> toJson() => _$TasksToJson(this);
}
