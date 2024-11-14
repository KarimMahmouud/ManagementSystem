part of 'tasks_cubit.dart';

@immutable
sealed class TasksState {}

final class TasksInitial extends TasksState {}

final class TasksLoaded extends TasksState {
  final List<Tasks> tasks;

  TasksLoaded(this.tasks);  

  
}
