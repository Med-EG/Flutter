import 'package:flutter/material.dart';
import 'package:med_eg/widgets/customDoctorinfoCard.dart';
import 'package:med_eg/models/doctorInfoModel.dart';

class DoctorCardListView extends StatelessWidget {
  const DoctorCardListView({super.key});

  final List<DoctorModel> Doctors = const [
   
   DoctorModel(image: 'assets/images/PNG/Dr.png', doctorName: 'Name', specification: 'specification', rate: 4.8, location: 'location'),
   DoctorModel(image: 'assets/images/PNG/Dr.png', doctorName: 'Name', specification: 'specification', rate: 4.8, location: 'location'),
   DoctorModel(image: 'assets/images/PNG/Dr.png', doctorName: 'Name', specification: 'specification', rate: 4.8, location: 'location'),
   DoctorModel(image: 'assets/images/PNG/Dr.png', doctorName: 'Name', specification: 'specification', rate: 4.8, location: 'location')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Doctors.length,   
          physics:const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return DoctorInfoCard(doctor: Doctors[index]);
          }),
    );
  }
}
