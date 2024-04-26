import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/DoctorViews/DoctorHomeScreen.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/LoginCubit/login_states.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';
import 'package:med_eg/widgets/signUP_with.dart';
import 'package:med_eg/Views/RestPassword.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  final String id = 'Login';
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
  GlobalKey<FormState> formKey = GlobalKey();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    var url = ModalRoute.of(context)!.settings.arguments;
    String email = emailController.text;
    String password = passwordController.text;
    double screenHieght = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: ((context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is SuccessPatient) {
          Navigator.pushReplacementNamed(context,  PatientHomeScreen().id);
          isLoading = false;
        } else if (state is SuccessDoctor) {
          Navigator.pushReplacementNamed(context,  DoctorHomeScreen().id);
          isLoading = false;
        } else if (state is ShowPassword) {
          _obscureText = !_obscureText;
        } else if (state is InvalidData) {
          isLoading = false;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: Text(state.message),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }),
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
            body: Form(
          key: formKey,
          child: Stack(
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
                        child: TextFormField(
                          onChanged: (value) {
                            // BlocProvider.of<LoginCubit>(context).updateEmail(value);
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'this field is required';
                            } else if (!data.contains('@')) {
                              return ' wrong format';
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: emailBorderColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: emailBorderColor),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 23, horizontal: 15),
                            hintText: 'E-mail@any.com',
                            prefixIcon: const Icon(Icons.email_rounded),
                            label: Text(
                              'E-mail@any.com',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8)),
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
                        child: TextFormField(
                          obscureText: _obscureText,
                          onChanged: (value) {
                            // BlocProvider.of<LoginCubit>(context).updatePassword(value);
                          },
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'this field is required';
                            }
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: emailBorderColor),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 23, horizontal: 15),
                            hintText: '********',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<LoginCubit>(context)
                                      .PasswordVisabilty();
                                },
                                icon: Icon(_obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined)),
                            label: Text(
                              'Enter password',
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: passwordBorderColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: passwordBorderColor),
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
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
                            if (formKey.currentState!.validate()) {
                              var login = BlocProvider.of<LoginCubit>(context);

                              login.login(
                                url: url.toString(),
                                body: {'email': email, 'password': password},
                              );

                              // Proceed with login functionality
                              // Api().post(
                              //     url:
                              //         'https://api-medeg.online/medEG/patient/login',
                              //     body: {
                              //       'email': email,
                              //       'password': password
                              //     });
                            } else {}
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
          ),
        )),
      ),
    );
  }
}