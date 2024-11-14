import 'dart:convert';
import 'package:flutter/material.dart';
import '../../const.dart';
import '../widget/button.dart';
import '../widget/formFild.dart';
import '../widget/swap.dart';
import 'task_list.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.access_alarm),
      //   backgroundColor: Color.fromARGB(220, 164, 124, 100),
      // ),
      // backgroundColor: Color.fromARGB(220, 164, 124, 100),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(220, 164, 124, 100),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150, left: 20),
            child: Text(
              'Go ahead and set up\n your account',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
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
                    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
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
                    padding: EdgeInsets.only(top: 20, right: 35, left: 35),
                    child: FormFild(
                      controller: emailController,
                      hint: 'Email email',
                      text: 'Email',
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: 20, right: 35, left: 35, bottom: 20),
                    child: FormFild(
                      controller: passwordController,
                      hint: 'Enter password',
                      text: 'Password',
                    ),
                  ),
                  Button(
                    onTap: () {
                      validation();
                    },
                    text: 'Login',
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Or login with',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            child: Image.asset(
                              'assets/images/google.png',
                              width: 19,
                              height: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                          onPressed: () {
                            // print('tokennnnnnnnnnnnnnnnn${tokenNew}');
                          },
                          icon: Icon(
                            Icons.apple,
                            size: 27,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mail,
                            size: 22,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'By singing up, you agree to our Terms of service \n and Privacy policy ',
                      textAlign: TextAlign.center,
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

  validation() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        !emailController.text.contains('@task.com')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('incorrect data, Please enter correct data'),
        ),
      );
    } else {
      final String url =
          'http://192.168.1.10/karimTestAPI/public/api/Make/Login';
      final response = await http.post(Uri.parse(url), body: {
        'email': emailController.text,
        'password': passwordController.text,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // ignore: unused_local_variable
         tokeen = data['token'];
        // context.read()<TasksCubit>().setToken(token);
        if (data['mes'] == 'incorrect') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${data['errors']['email'][0]}'),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TaskList()),
          );
        }
        print('thissssss ${data}');
      } else {
        print('error');
      }
    }
  }
}