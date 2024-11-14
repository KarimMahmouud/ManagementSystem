import 'package:crud/data_layer/web_services/tasks_srevices.dart';

import '../model/tasks_data.dart';

class TasksRepository {
  final TasksWebServices tasksWebServices;
  TasksRepository(this.tasksWebServices);

  Future<List<Tasks>> getAllTasks() async {
    final tasks = await tasksWebServices.getAllTasks();
    return tasks.map((tasks) => Tasks.fromJson(tasks)).toList();
  }
}
