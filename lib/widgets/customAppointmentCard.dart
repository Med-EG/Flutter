import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModel.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.16),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.transparent)),
        height: 70,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                appointment.doctorImage,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Dr.${appointment.doctorFirstName} ${appointment.doctorLastName}',
                    style: const TextStyle(
                        color: darkBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      
                      Center(
                        child: Text(
                          appointment.date,
                          style: const TextStyle(color: darkBlue, fontSize: 15),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
