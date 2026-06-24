// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:med_eg/Views/reserve_doctor.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
import '../widgets/find_doctor_card.dart';

class DoctorBySpecialization extends StatelessWidget {
  const DoctorBySpecialization(
      {super.key, required this.specialization, required this.allDoctors});
  static const String id = 'DoctorBySpecialization';
  final String specialization;
  final List<DoctorModelWithoutToken> allDoctors;
  @override
  Widget build(BuildContext context) {
    List<DoctorModelWithoutToken> filteredDoctors = allDoctors
        .where((doctor) => doctor.specification == specialization)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors: $specialization'),
      ),
      body: filteredDoctors.isNotEmpty
          ? ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                return Column(
                  children: allDoctors.map((doctor) {
                    return Column(
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(16),
                          child: FindDoctorCard(
                            doctor: doctor,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ReserveDoctor.id,
                                arguments: {'doctor': doctor},
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            )
          : const Center(child: Text('No doctors available')),
    );
  }
}