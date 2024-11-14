class Tasks {
  late int id;
  late String assignFromName;
  late String assignUserName;
  late String assignStatusName;
  late String title;
  late String description;
  late String startTime;
  late String endTime;

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignFromName = json['assign_from'];
    assignUserName = json['assign_user'];
    assignStatusName = json['assign_status'];
    title = json['title'];
    description = json['description'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }
}
