import 'package:crud/business_logic_layer/cubit/cubit/tasks_cubit.dart';
import 'package:crud/data_layer/repository/tasks_repository.dart';
import 'package:crud/data_layer/web_services/tasks_srevices.dart';
import 'package:crud/presention_layer/screens/add_task.dart';
import 'package:crud/presention_layer/screens/detailes_screen.dart';
import 'package:crud/presention_layer/screens/edit_task.dart';
import 'package:crud/presention_layer/screens/sign_in.dart';
import 'package:crud/presention_layer/screens/sign_up.dart';
import 'package:crud/presention_layer/screens/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'const.dart';

class AppRouter {
  late TasksRepository tasksRepository;
  late TasksCubit tasksCubit;

  AppRouter() {
    tasksRepository = TasksRepository(TasksWebServices());
    tasksCubit = TasksCubit(tasksRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => tasksCubit,
            child: const SignIn(),
          ),
        );
      case signUp:
        return MaterialPageRoute(
          builder: (_) => SignUp(),
        );
      case taskList:
        return MaterialPageRoute(
          builder: (_) => TaskList(),
        );
      case editTask:
        return MaterialPageRoute(
          builder: (_) => EditTask(),
        );
      case detailesScreen:
      // final tasks = settings.arguments as Tasks;
        return MaterialPageRoute(
          builder: (_) => DetailesScreen(),
        );
      case addTask:
        return MaterialPageRoute(
          builder: (_) => AddTask(),
        );
    }
    return null;
  }
}
