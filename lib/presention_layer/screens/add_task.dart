import 'package:crud/business_logic_layer/cubit/cubit/tasks_cubit.dart';
import 'package:crud/data_layer/model/tasks_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../widget/button.dart';
import '../widget/formfild.dart';

class AddTask extends StatefulWidget {
  final String token;
  AddTask({
    super.key,
    required this.token,
  });

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String startTime = '00:00';
  String endTime = '00:00';
  String? selctedDep;
  String assign = 'To';
  List<Map<String, dynamic>> depList = [
    {'id': 1, 'name': 'Hr'},
    {'id': 2, 'name': 'It'},
    {'id': 3, 'name': 'Sales'},
  ];
  List<Map<String, dynamic>> assignList = [
    {'id': 1, 'name': 'karim'},
    {'id': 2, 'name': 'adly'},
    {'id': 3, 'name': 'youhana'},
  ];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController depController = TextEditingController();
  final TextEditingController assignController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getTimeFromUser({required bool isStartTime}) async {
      // عرض نافذة اختيار الوقت
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
      );

      if (pickedTime != null) {
        // تحويل TimeOfDay إلى DateTime
        final DateTime now = DateTime.now();
        final DateTime dateTime = DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // تنسيق الوقت باستخدام DateFormat
        String formattedTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

        // تخزين الوقت في المتغير المناسب
        if (isStartTime) {
          setState(() {
            startTime = formattedTime;
          });
        } else {
          setState(() {
            endTime = formattedTime;
          });
        }
      } else {
        // في حال تم إلغاء اختيار الوقت
        debugPrint('Time picker canceled or something went wrong');
      }
    }

    // getTimeFromUser({required bool isStartTime}) async {
    //   dynamic pickedTime = await showTimePicker(
    //       context: context,
    //       initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    //   dynamic formattedTime =
    //       DateFormat('yyyy-MM-dd HH:mm:ss').format(pickedTime!).toString();

    //    String formattedTime = pickedTime!.format(context);

    //   if (!isStartTime) {
    //     setState(() => startTime = formattedTime);
    //   } else if (isStartTime) {
    //     setState(() => endTime = formattedTime);
    //   } else {
    //     debugPrint('time cancled or someting is wrong');
    //   }
    // }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(220, 164, 124, 100),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120, left: 20),
            child: Text(
              'Add Task',
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20, right: 35, left: 35),
                    child: FormFild(
                      text: 'Title of task',
                      hint: '',
                      controller: titleController,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 8, right: 35, left: 35),
                    child: FormFild(
                      text: 'Description of task',
                      hint: '',
                      controller: descController,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 8, right: 35, left: 35),
                    child: FormFild(
                      text: 'Department',
                      hint: selctedDep ?? 'dep',
                      controller: depController,
                      widget: Row(
                        children: [
                          DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Color.fromARGB(255, 165, 166, 167),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: 30,
                            ),
                            elevation: 4,
                            underline: Container(height: 0),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            items: depList
                                .map<DropdownMenuItem<dynamic>>(
                                  (value) => DropdownMenuItem<dynamic>(
                                    value: value['id'],
                                    child: Text(value['name']),
                                  ),
                                )
                                .toList(),
                            onChanged: (dynamic value) {
                              setState(() => selctedDep = value.toString());
                            },
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 8, right: 35, left: 35),
                    child: FormFild(
                      text: 'Assign to',
                      hint: '$assign ',
                      controller: assignController,
                      widget: Row(
                        children: [
                          DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Color.fromARGB(255, 165, 166, 167),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                              size: 30,
                            ),
                            elevation: 4,
                            underline: Container(height: 0),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            items: assignList
                                .map<DropdownMenuItem<dynamic>>((index) {
                              return DropdownMenuItem<dynamic>(
                                value: index['id'], // القيمة هي المعرف
                                child: Text(index['name']), // العرض هو الاسم
                              );
                            }).toList(),
                            onChanged: (dynamic value) {
                              setState(() {
                                setState(() => assign = value.toString());
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 8, right: 35, left: 35),
                    child: Row(
                      children: [
                        Expanded(
                          child: FormFild(
                            text: 'Start Time',
                            hint: startTime,
                            widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: true);
                              },
                              icon: const Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: FormFild(
                            text: 'End Time',
                            hint: endTime,
                            widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: false);
                              },
                              icon: const Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Button(
                      onTap: () {
                        BlocProvider.of<TasksCubit>(context).creatTasks(
                          Tasks(
                            assign_department: selctedDep,
                            title: titleController.text,
                            description: descController.text,
                            assign_user: assign,
                            start_time: startTime,
                            end_time: endTime,
                            assign_from: '1',
                            attachment: 'newTask',
                          ),
                          "Bearer ${widget.token}",
                        );
                        Navigator.pop(context);

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BlocProvider(
                        //       create: (context) => getIt<TasksCubit>(),
                        //       child: TaskList(token: "Bearer ${widget.token}"),
                        //     ),
                        //   ),
                        // );
                      },
                      text: 'Save',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
