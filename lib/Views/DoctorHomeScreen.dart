import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});
  final String id='DoctorHomeScreen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Center(
        child: Column(
          children: [
             Image.asset('assets/images/PNG/AppLogo.png'),

          ],
        ),
      ),
    );
  }
}