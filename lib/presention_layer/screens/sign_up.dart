import 'dart:convert';

import 'package:crud/presention_layer/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widget/button.dart';
import '../widget/formfild.dart';
import '../widget/swap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(220, 164, 124, 100),
            child: Padding(
              padding: EdgeInsets.only(top: 150, left: 20),
              child: Text(
                'Go ahead and set up\n your account',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
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
                    margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(225, 231, 231, 231),
                    ),
                    child: swap(),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 10, right: 35, left: 35),
                    child: FormFild(
                      controller: usernameController,
                      text: 'Username',
                      hint: 'your username',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      right: 35,
                      left: 35,
                    ),
                    child: FormFild(
                      controller: emailController,
                      text: 'Email',
                      hint: 'your email',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      right: 35,
                      left: 35,
                    ),
                    child: FormFild(
                      controller: passwordController,
                      text: 'Password',
                      hint: 'your password',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      right: 35,
                      left: 35,
                    ),
                    child: FormFild(
                      controller: confirmPasswordController,
                      text: 'Confirm password',
                      hint: 'confirm password',
                    ),
                  ),
                  Button(
                    onTap: () {
                      validation();
                    },
                    text: 'Register',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  validation() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty ||
        !emailController.text.contains('@task.com') ||
        (passwordController.text != confirmPasswordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('incorrect data, Please enter correct data'),
        ),
      );
    } else {
      final String url =
          'http://192.168.1.10/karimTestAPI/public/api/Make/Register';
      final response = await http.post(Uri.parse(url),
          // headers: {'Authorization':'Bearer ${widget.token}'},
          body: {
            'username': usernameController.text,
            'email': emailController.text,
            'password': passwordController.text,
          });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['mes'] == 'incorrect') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${data['errors']['email'][0]}'),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        }
        print('thissssss ${data}');
      } else {
        print('error');
      }
    }
  }
}
