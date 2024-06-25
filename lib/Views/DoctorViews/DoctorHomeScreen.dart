// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/widgets/Doctor_widgets/DoctorHomePageCardListView.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});
  final String id = 'DoctorHomeScreen';

  @override
  Widget build(BuildContext context) {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    return Scaffold(
        body: Stack(children: [
      Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset('assets/images/PNG/Frame.png')),
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/PNG/AppLogo.png',
                height: 50,
              ),
             const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: ClipOval(
                  child: Image.network(
                    fit: BoxFit.cover,
                    'https://api-medeg.online/${doctor!.doctorImage}',
                  ),
                ),
              ),
             const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                 const Text(
                    'Hello, DR ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    doctor.doctorFirstName,
                    style:const TextStyle(
                        color: Color(0xff407CE2),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                 const Spacer(
                    flex: 1,
                  ),
                ],
              ),
             const SizedBox(height: 30,),
              const Expanded(child: DoctorHomePageCardListView()),
            ],
          ),
        ),
      ),
    ]));
  }
}
