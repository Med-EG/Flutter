import 'package:flutter/material.dart';
import 'package:med_eg/Views/ShowAppointmentsInfoDoctor.dart';
import 'package:med_eg/widgets/customAppointmentCard.dart';
import 'package:med_eg/models/appointmentModel.dart';

class AppointmentListViewForDoctor extends StatelessWidget {
  AppointmentListViewForDoctor({super.key});
  final List<AppointmentModel> Appointments = const [
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'Patient 1',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'Patient 2',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'Patient 3',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'Patient 4',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday ,',
        doctorName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        time: '6:00 PM'),
    AppointmentModel(
        day: 'Sunday',
        doctorName: 'Patient 6',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1',
        time: '6:00'),
  ];
  AppointmentModel? appointmentSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: Appointments.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ShowAppointmentInfoDoctor().id,
                      arguments: appointmentSelected = Appointments[index]);
                },
                child: AppointmentCard(appointment: Appointments[index]));
          })),
    );
  }
}
