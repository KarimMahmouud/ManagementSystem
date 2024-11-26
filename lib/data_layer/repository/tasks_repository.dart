import 'package:crud/data_layer/web_services/tasks_srevices.dart';

import '../model/tasks_data.dart';

class TasksRepository {
  final TasksWebServices tasksWebServices;
  TasksRepository(this.tasksWebServices);

  Future<List<Tasks>> getTasks(String token) async {
    return await tasksWebServices.getTasks(token);
  }

  Future<Tasks> creatNewTask(Tasks newTask,String token ) async {
    return await tasksWebServices.creatNewTask(newTask ,token);
  }
}