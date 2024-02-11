import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/AppointmentsListView.dart';


class ShowPatientAppointments extends StatelessWidget {
  const ShowPatientAppointments({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
          SizedBox(height: 85,),
             Text(
                'Appointments',
                style: TextStyle(
                    color: darkBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),),
                AppointmentListView(),
               SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}