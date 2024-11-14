import 'package:flutter/material.dart';

class FormFild extends StatelessWidget {
  final String hint;
  final String text;
  final TextEditingController? controller;
  final Widget? widget;
  FormFild({
    super.key,
    required this.hint,
    required this.text,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.only(left: 10),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(225, 231, 231, 231),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(children: [
            Expanded(
              child: TextFormField(
                obscureText: text == 'Password'
                    ? true
                    : text == 'Confirm password'
                        ? true
                        : false,
                controller: controller,
                autofocus: false,
                cursorColor: Colors.grey[700],
                readOnly: widget != null ? true : false,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      // color: Colors.red,
                      width: 0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      // color: Colors.red,
                      width: 0,
                    ),
                  ),
                ),
              ),
            ),
            widget ?? Container(),
          ]),
        ),
      ]),
    );
  }
}
    
//     Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         Container(
//           height: 50,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Color.fromARGB(225, 231, 231, 231),
//           ),
//           child: TextField(
//             controller: controller,
//             obscureText: text == 'Password'
//                 ? true
//                 : text == 'Confirm password'
//                     ? true
//                     : false,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(
//                 color: Color.fromARGB(255, 130, 127, 127),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
