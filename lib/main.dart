import 'package:flutter/material.dart';
import 'package:med_eg/screens/HomeScreen.dart';
import 'package:med_eg/screens/signUp1.dart';
import 'package:med_eg/screens/signUp2.dart';
import 'package:med_eg/screens/signUp3.dart';

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
        
      ),
      routes: {
        '/signUp1':(context) => const SignUp1(),
        '/signUp2':(context) => const SignUp2(),
        '/signUp3':(context) => const SignUp3(),
      },
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
