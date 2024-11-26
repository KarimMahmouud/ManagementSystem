import 'package:bloc/bloc.dart';
import 'package:crud/data_layer/repository/tasks_repository.dart';
import 'package:meta/meta.dart';
import '../../../data_layer/model/tasks_data.dart';
part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepository tasksRepository;

  List<Tasks> tasks = [];

  TasksCubit(this.tasksRepository) : super(TasksInitial());

  void getTasks(String token) {
    tasksRepository.getTasks(token).then(
          (tasks) => emit(TasksLoaded(tasks)),
        );
  }

  Future creatTasks(Tasks newTasks, String token)async {
   await tasksRepository
        .creatNewTask(newTasks, token)
        .then((tasks) => emit(CreatNewTask(newTasks)));
  }
}
