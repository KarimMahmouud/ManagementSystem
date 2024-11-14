import 'package:flutter/material.dart';

import '../widget/button.dart';
import '../widget/formfild.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String startTime = '00:00';
  String endTime = '00:00';
  String selctedDep = 'Karim';
  String assign = 'To';
  final List depList = [
    'Eng',
    'Doc',
    'Karim',
  ];
  final List assignList = [
    'Karin',
    'Youhana',
    'Basant',
  ];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController depController = TextEditingController();
  final TextEditingController assignController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getTimeFromUser({required bool isStartTime}) async {
      TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(DateTime.now()));

      // ignore: use_build_context_synchronously
      String formattedTime = pickedTime!.format(context);

      if (!isStartTime) {
        setState(() => startTime = formattedTime);
      } else if (isStartTime) {
        setState(() => endTime = formattedTime);
      } else {
        debugPrint('time cancled or someting is wrong');
      }
    }

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
                      hint: '$selctedDep ',
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
                                .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      "$value",
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              setState(() => selctedDep = value!);
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
                                .map<DropdownMenuItem<String>>(
                                  (value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      "$value",
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                setState(() => assign = value!);
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
                                getTimeFromUser(isStartTime: false);
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
                                getTimeFromUser(isStartTime: true);
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
                      onTap: () {},
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
