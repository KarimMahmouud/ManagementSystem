import 'package:crud/business_logic_layer/cubit/cubit/tasks_cubit.dart';
import 'package:crud/presention_layer/screens/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data_layer/model/tasks_data.dart';
import 'add_task.dart';

class TaskList extends StatefulWidget {
  // final String token;
  const TaskList({
    super.key,
    // required this.token,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  late List<Tasks> allTasks = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TasksCubit>(context).getAllTasks();
    print(allTasks);
  }

  Widget buildeBlockWidget() {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          allTasks = (state).tasks;
          return biuldLodaedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget biuldLodaedListWidget() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(220, 164, 124, 100),
        ),
        Padding(
          padding: EdgeInsets.only(top: 120, left: 20),
          child: Text(
            'Task List',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(23),
              topLeft: Radius.circular(23),
            ),
            color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: allTasks.length,
            itemBuilder: (context, index) {
              if (allTasks.isEmpty) {
                return InkWell(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: BorderDirectional(
                          bottom: BorderSide(
                            width: 5,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          'assets/images/load.gif',
                        ),
                        //  Icon(
                        //   Icons.check_circle,
                        //   // Icons.schedule,
                        //   color: Color.fromRGBO(32, 173, 90, 100),
                        //   size: 55,
                        // ),
                        title: Text('.....'),
                        subtitle: Text('Description ...'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                size: 24,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EditTask(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 100,
                        color: Color.fromRGBO(105, 132, 116, 100),
                      ),
                      Text(
                        'No users have been added yet.',
                        style: TextStyle(
                          color: Color.fromRGBO(105, 132, 116, 100),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: buildeBlockWidget(),
      floatingActionButton: IconButton(
        style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(
          Color.fromRGBO(105, 132, 116, 100),
        )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTask(),
            ),
          );
        },
        icon: Icon(
          Icons.add_circle_outlined,
          size: 60,
        ),
      ),
    );
  }
}
