import 'package:flutter/material.dart';
import 'package:med_eg/Views/HomeScreen.dart';
import 'package:med_eg/Views/signUp1.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';
import 'package:med_eg/widgets/signUP_with.dart';
import 'package:med_eg/Views/RestPassword.dart';

import '../widgets/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  final String id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  //TextEditingController _passwordController =
    //  TextEditingController(text: '***');

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              right: -80, top: -80, child: CustomCircleContainer()),
          const Positioned(
              left: -180, bottom: -180, child: CustomCircleContainer()),
          ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Spacer(
                        flex: 3,
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextField(
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 15),
                        hintText: 'E-mail',
                        prefixIcon: const Icon(Icons.email_rounded),
                        label: Text(
                          'Enter E-mail address',
                          style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          // borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TextField(
                      obscureText: _obscureText,
                      onSubmitted: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 15),
                        hintText: '********',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(_obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined)),
                        label: Text(
                          'Enter password',
                          style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ResetPassword().id);
                        },
                        child: const Text(
                          'forget password?',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHieght * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      text: 'Login',
                      color: kPrimaryColor,
                      onTap: () {
                        Navigator.pushNamed(context,const HomeScreen().id);
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHieght * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'You don\'t have account?',
                        style: TextStyle(fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, const SignUp1().id);
                        },
                        child: const Text(
                          'signup',
                          style:
                              TextStyle(color: Color(0xff5389e4), fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHieght * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 74,
                        height: 1,
                        color: const Color(0xffB4BAC9),
                      ),
                      const Text(
                        ' Or ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xffB4BAC9)),
                      ),
                      Container(
                        width: 74,
                        height: 1,
                        color: const Color(0xffB4BAC9),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHieght * 0.03,
                  ),
                  const SignUpWith(
                    image: 'assets/images/PNG/facebook.png',
                    text: 'Login with Facebook',
                  ),
                  SizedBox(
                    height: screenHieght * 0.02,
                  ),
                  const SignUpWith(
                    image: 'assets/images/PNG/google.png',
                    text: 'Login with Google',
                  ),
                  SizedBox(
                    height: screenHieght * 0.02,
                  ),
                  const SignUpWith(
                    image: 'assets/images/PNG/dribbble.png',
                    text: 'Login with your E-mail',
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
