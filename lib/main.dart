import 'package:crud/business_logic_layer/cubit/cubit/tasks_cubit.dart';
import 'package:crud/di.dart';
import 'package:crud/presention_layer/screens/sign_in.dart';
import 'package:crud/presention_layer/screens/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic_layer/ob.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  iniGetIt();
  prefs = await SharedPreferences.getInstance();
  Bloc.observer = myBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: BlocProvider(
        create: (context) => getIt<TasksCubit>(),
        child: prefs.getString('token') == null
            ? SignIn()
            : TaskList(token: prefs.getString('token')!),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// // ignore: must_be_immutable
// class MyApp extends StatelessWidget {
//   late TasksRepository tasksRepository;
//   late TasksCubit tasksCubit;

//   MyApp() {
//     tasksRepository = TasksRepository(TasksWebServices());
//     tasksCubit = TasksCubit(tasksRepository);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => tasksCubit,
//       child: MaterialApp(
//         onGenerateRoute: AppRouter().generateRoute,
//       ),
//     );
//   }
// }




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
