import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/LoginCubit/login_states.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';
import 'package:med_eg/widgets/signUP_with.dart';
import 'package:med_eg/Views/RestPassword.dart';
import '../widgets/custom_button.dart';

class Login extends StatefulWidget {
  Login({super.key});
  final String id = 'Login';
  final Future<String?> token = Api().getToken();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  bool isLoading = false;
  bool _obscureText = true;
  bool showEmailError = false;
  bool showPasswordError = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Color emailBorderColor = Colors.grey;
  Color passwordBorderColor = Colors.grey;
  String emailErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;
    double screenHieght = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Success) {
          Navigator.pushNamed(context, const PatientHomeScreen().id,);
        } else if (state is MissingData) {
          passwordBorderColor = emailBorderColor = Colors.red;
          passwordErrorMessage = emailErrorMessage = state.message;
        }

        return Stack(
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
                        onSubmitted: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: emailBorderColor),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 23, horizontal: 15),
                          hintText: 'E-mail',
                          prefixIcon: const Icon(Icons.email_rounded),
                          label: Text(
                            'Enter E-mail address',
                            style:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: emailBorderColor),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      emailErrorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextField(
                        obscureText: _obscureText,
                        onSubmitted: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        controller: passwordController,
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
                            style:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: passwordBorderColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: passwordBorderColor),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      passwordErrorMessage,
                      style: const TextStyle(color: Colors.red),
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
                        onTap: () async {
                          if (email.isEmpty) {
                            setState(() {
                              emailBorderColor = Colors.red;
                              emailErrorMessage = 'This text field is required';
                            });
                          } else {
                            setState(() {
                              emailBorderColor = Colors.grey;
                              emailErrorMessage = '';
                            });
                          }

                          if (password.isEmpty) {
                            setState(() {
                              passwordBorderColor = Colors.red;
                              passwordErrorMessage =
                                  'This text field is required';
                            });
                          } else {
                            setState(() {
                              passwordBorderColor = Colors.grey;
                              passwordErrorMessage = '';
                            });
                          }

                          if (email.isNotEmpty && password.isNotEmpty) {
                            var login = BlocProvider.of<LoginCubit>(context);
                            login.login(email: email, password: password);

                            // Proceed with login functionality
                            // Api().post(
                            //     url:
                            //         'https://api-medeg.online/medEG/patient/login',
                            //     body: {
                            //       'email': email,
                            //       'password': password
                            //     });
                          }
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
                            Navigator.pushNamed(context, const SignUp2().id);
                          },
                          child: const Text(
                            'signup',
                            style: TextStyle(
                                color: Color(0xff5389e4), fontSize: 12),
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
                      height: screenHieght * 0.015,
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
        );
      }),
    );
  }
}
