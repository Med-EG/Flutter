import 'package:flutter/material.dart';
import 'package:med_eg/Views/loginScreen.dart';
import 'package:med_eg/Views/onBoarding.dart';
import 'package:med_eg/Views/signUp1.dart';
import 'package:med_eg/Views/signUp10.dart';
import 'package:med_eg/Views/signUp11.dart';
import 'package:med_eg/Views/signUp12.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/Views/signUp3.dart';
import 'package:med_eg/Views/signUp7.dart';
import 'package:med_eg/Views/signUp8.dart';
import 'package:med_eg/Views/signUp9.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Encode Sans Expanded'),
      routes: {

        '/signUp1': (context) => const SignUp1(),
        '/signUp2': (context) => const SignUp2(),
        '/signUp3': (context) => const SignUp3(),
        '/signUp7': (context) => const SignUp7(),
        '/signUp8': (context) => const SignUp8(),
        '/signUp9': (context) => const SignUp9(),
        '/signUp10': (context) => const SignUp10(),
        '/signUp11': (context) => const SignUp11(),
        '/signUp12': (context) => const SignUp12(),
        const Login().id:(context) => const Login(),
      },
      debugShowCheckedModeBanner: false,
      home:  OnBording(),

    );
  }
}
