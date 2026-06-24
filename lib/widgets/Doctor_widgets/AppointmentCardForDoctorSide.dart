import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModelForDoctorSide.dart';

class AppointmentCardForDoctorSide extends StatelessWidget {
  const AppointmentCardForDoctorSide({
    super.key,
    required this.appointment,
    required this.ontap,
  });

  final AppointmentModelForDoctorSide appointment;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    late String time;
    final List<String> timeComponents = appointment.time.split(':');
    final int hour = int.parse(timeComponents[0]);
    final int minute = int.parse(timeComponents[1]);

    if (hour < 12) {
      time = appointment.time + ' AM';
    } else {
      time = '${hour - 12}:$minute PM';
    }
    final formattedDate =
        DateFormat('yyyy-MM-dd / ').format(DateTime.parse(appointment.date));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: ontap,
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
                      'https://api-medeg.online/${appointment.patientImage}',
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
                      '${appointment.patientFirstName} ${appointment.patientLastName}',
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
                        Text(
                          time,
                          style: const TextStyle(color: darkBlue, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
