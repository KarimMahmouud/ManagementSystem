import 'package:crud/presention_layer/screens/sign_in.dart';
import 'package:crud/presention_layer/screens/sign_up.dart';
import 'package:flutter/material.dart';

class swap extends StatefulWidget {
  const swap({super.key});

  @override
  State<swap> createState() => _swapState();
}

bool colorISloginOrRegister = true;

class _swapState extends State<swap> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              colorISloginOrRegister = true;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignIn(),
              ),
            );
          },
          child: Container(
            width: 120,
            height: 35,
            decoration: BoxDecoration(
              color: colorISloginOrRegister
                  ? Colors.white
                  : Color.fromARGB(225, 231, 231, 231),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text('Login'),
            ),
          ),
        ),
        SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {
            // Future.delayed(Duration(seconds: 10));
            setState(() {
              colorISloginOrRegister = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUp(),
              ),
            );
          },
          child: Container(
            width: 120,
            height: 35,
            decoration: BoxDecoration(
              color: !colorISloginOrRegister
                  ? Colors.white
                  : Color.fromARGB(225, 231, 231, 231),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text('Register'),
            ),
          ),
        ),
      ],
    );
  }
}
