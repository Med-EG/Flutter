import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/AppointmentListViewForDoctor.dart';


class ShowPatientAppointments extends StatelessWidget {
  const ShowPatientAppointments({super.key});

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
          const SizedBox(height: 85,),
             const Text(
                'Appointments',
                style: TextStyle(
                    color: darkBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),
                AppointmentListViewForDoctor(),
               const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}