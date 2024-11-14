import 'package:crud/business_logic_layer/cubit/cubit/tasks_cubit.dart';
import 'package:crud/data_layer/repository/tasks_repository.dart';
import 'package:crud/data_layer/web_services/tasks_srevices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';

// void main() {
//   runApp(MyApp(
//     appRouter: AppRouter(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key, required this.appRouter});
//   final AppRouter appRouter;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: appRouter.generateRoute,
//         theme: ThemeData(useMaterial3: true));
//   }
// }

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late TasksRepository tasksRepository;
  late TasksCubit tasksCubit;

  MyApp() {
    tasksRepository = TasksRepository(TasksWebServices());
    tasksCubit = TasksCubit(tasksRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => tasksCubit,
      child: MaterialApp(
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}




// Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Color.fromARGB(220, 164, 124, 100),
//           ),
//           Container( margin: EdgeInsets.only(top: 200),
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(23),
//                 topLeft: Radius.circular(23),
//               ),
//               color: Colors.white,
//             ),),
//         ],
//       ),
