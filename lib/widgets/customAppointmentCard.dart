import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModel.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd / hh:mm a').format(DateTime.parse(appointment.date));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.16),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.transparent)),
        height: 80,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                // width: 70,
                height: 70,
                child: ClipOval(
                  child: Image.network(
                    fit: BoxFit.cover,
                    'https://api-medeg.online/${appointment.doctorImage}',
                    // 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
                    // height: 47,
                    // width: 47,
                  ),
                ),
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
                          formattedDate,
                          style:
                              const TextStyle(color: darkBlue, fontSize: 15),
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
