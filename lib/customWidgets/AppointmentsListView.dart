import 'package:flutter/material.dart';
import 'package:med_eg/customWidgets/customAppointmentCard.dart';
import 'package:med_eg/models/appointmentModel.dart';

class AppointmentListView extends StatelessWidget {
  const AppointmentListView({super.key});
  final List<AppointmentModel> Appointments = const [
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'doctorName',
        doctorImage: 'assets/images/PNG/UserPhoto.png',
        date: '27/1 | ',
        time: '6:00 PM'),
     AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'doctorName',
        doctorImage: 'assets/images/PNG/UserPhoto.png',
        date: '27/1 | ',
        time: '6:00 PM'),
     AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'doctorName',
        doctorImage: 'assets/images/PNG/UserPhoto.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'doctorName',
        doctorImage: 'assets/images/PNG/UserPhoto.png',
        date: '27/1 | ',
        time: '6:00 PM'),
     AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'doctorName',
        doctorImage: 'assets/images/PNG/UserPhoto.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday',
        doctorName: 'doctorName',
        doctorImage: 'assets/images/PNG/UserPhoto.png',
        date: '27/1',
        time: '6:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Appointments.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return AppointmentCard(appointment: Appointments[index]);
          })),
    );
  }
}
