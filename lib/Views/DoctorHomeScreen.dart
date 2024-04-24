import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';

class DoctorHomeScreen extends StatelessWidget {
   DoctorHomeScreen({super.key});
  final String id = 'DoctorHomeScreen';
   
  @override
  Widget build(BuildContext context) {
   // DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/PNG/AppLogo.png',
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
