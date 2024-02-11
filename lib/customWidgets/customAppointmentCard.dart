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
            color:const Color(kPrimaryColor).withOpacity(0.16),
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
                    appointment.doctorName,
                    style: const TextStyle(
                        color: Color(kTextColor),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        appointment.day,
                        style: const TextStyle(
                            color: Color(kTextColor), fontSize: 15),
                      ),
                      Text(
                        appointment.date,
                        style: const TextStyle(
                            color: Color(kTextColor), fontSize: 15),
                      ),
                      Text(
                        appointment.time,
                        style: const TextStyle(
                            color: Color(kTextColor), fontSize: 15),
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
