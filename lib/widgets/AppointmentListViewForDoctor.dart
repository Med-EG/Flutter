import 'package:flutter/material.dart';
import 'package:med_eg/Views/ShowAppointmentsInfoDoctor.dart';
import 'package:med_eg/widgets/customAppointmentCard.dart';
import 'package:med_eg/models/appointmentModel.dart';

class AppointmentListViewForDoctor extends StatelessWidget {
  AppointmentListViewForDoctor({super.key});
  final List<AppointmentModel> appointments = const [
    AppointmentModel(
        doctorFirstName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        doctorLastName: 'adfasdf'),
    AppointmentModel(
        doctorFirstName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        doctorLastName: 'adfasdf'),
    AppointmentModel(
        doctorFirstName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        doctorLastName: 'adfasdf'),
    AppointmentModel(
        doctorFirstName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        doctorLastName: 'adfasdf'),
    AppointmentModel(
        doctorFirstName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        doctorLastName: 'adfasdf'),
    AppointmentModel(
        doctorFirstName: 'Patient 5',
        doctorImage: 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
        date: '27/1 | ',
        doctorLastName: 'adfasdf'),
  ];
  AppointmentModel? appointmentSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: appointments.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, const ShowAppointmentInfoDoctor().id,
                      arguments: appointmentSelected = appointments[index]);
                },
                child: AppointmentCard(appointment: appointments[index]));
          })),
    );
  }
}
