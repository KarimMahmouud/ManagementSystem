import 'package:bloc/bloc.dart';
import 'package:crud/data_layer/repository/tasks_repository.dart';
import 'package:meta/meta.dart';

import '../../../data_layer/model/tasks_data.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepository tasksRepository;

  List<Tasks> tasks = [];

  TasksCubit(this.tasksRepository) : super(TasksInitial());

  List<Tasks> getAllTasks() {
    tasksRepository.getAllTasks().then((tasks) {
      emit(TasksLoaded(tasks));
      this.tasks = tasks;
    });
    return tasks;
  }

  
}
