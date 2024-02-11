import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:med_eg/views/signUp1.dart';
import 'package:med_eg/views/signUp10.dart';
import 'package:med_eg/views/signUp11.dart';
import 'package:med_eg/views/signUp12.dart';
import 'package:med_eg/views/signUp2.dart';
import 'package:med_eg/views/signUp3.dart';
import 'package:med_eg/views/signUp7.dart';
import 'package:med_eg/views/signUp8.dart';
import 'package:med_eg/views/signUp9.dart';
=======
import 'package:med_eg/screens/CreateMedicineAlert.dart';
import 'package:med_eg/screens/HomeScreen.dart';
import 'package:med_eg/screens/NoAlertScreen.dart';
import 'package:med_eg/screens/NoPatientAppointmentsScreen.dart';
import 'package:med_eg/screens/ShowAppointmentPatient.dart';
import 'package:med_eg/screens/signUp1.dart';
import 'package:med_eg/screens/signUp2.dart';
import 'package:med_eg/screens/signUp3.dart';
>>>>>>> 5c51601f2c0e89a051f6c88747fffdf5bf90c3bd

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
<<<<<<< HEAD
        '/signUp1': (context) => const SignUp1(),
        '/signUp2': (context) => const SignUp2(),
        '/signUp3': (context) => const SignUp3(),
        '/signUp7': (context) => const SignUp7(),
        '/signUp8': (context) => const SignUp8(),
        '/signUp9': (context) => const SignUp9(),
        '/signUp10': (context) => const SignUp10(),
        '/signUp11': (context) => const SignUp11(),
        '/signUp12': (context) => const SignUp12(),
      },
      debugShowCheckedModeBanner: false,
      home: const SignUp2(),
=======
        '/signUp1':(context) => const SignUp1(),
        '/signUp2':(context) => const SignUp2(),
        '/signUp3':(context) => const SignUp3(),
        'HomeScreen':(context)=>const HomeScreen(),
        'CreateMedicineAlert':(context) => const CreateMedicineAlert(),
      },
      debugShowCheckedModeBanner: false,
      home: const NoAlertScreen(),
>>>>>>> 5c51601f2c0e89a051f6c88747fffdf5bf90c3bd
    );
  }
}
