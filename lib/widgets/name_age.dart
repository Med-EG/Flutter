import 'package:flutter/material.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'package:med_eg/services/GetPatientbyID.dart';

import '../constants/colors.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PatientInfo>(
        future: GetPatientByID().getPatientByID(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            PatientInfo? patientInfo = snapshot.data;
            if (patientInfo != null) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${patientInfo.firstName} ${patientInfo.lastName}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: darkBlue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '27 Years old',
                      style: TextStyle(
                          color: darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Error: Medical record data is null');
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
