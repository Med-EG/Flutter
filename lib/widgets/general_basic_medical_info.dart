import 'package:flutter/material.dart';

import '../models/medicalRecordModel.dart';
import 'general_info_row.dart';

// ignore: must_be_immutable
class CustomGeneralBasicMedicalInfo extends StatelessWidget {
   CustomGeneralBasicMedicalInfo({super.key,
  required this.medicalRecord});
  MedicalRecordModel medicalRecord;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GeneralInfoRow(
          text1: 'Height : ',
          text2: medicalRecord.height,
        ),
        GeneralInfoRow(
          text1: 'Weight : ',
          text2: medicalRecord.weight,
        ),
        GeneralInfoRow(
          text1: 'Blood type : ',
          text2: medicalRecord.blood_type,
        ),
        GeneralInfoRow(
          text1: 'Alcoholic : ',
          text2: medicalRecord.alcoholic,
        ),
        GeneralInfoRow(
          text1: 'Alcoholic Level : ',
          text2: medicalRecord.alcoholic_level,
        ),
        GeneralInfoRow(
          text1: 'Smoker : ',
          text2: medicalRecord.smoker,
        ),
        GeneralInfoRow(
          text1: 'Smoking Level : ',
          text2: medicalRecord.smoking_level,
        ),
        GeneralInfoRow(
          text1: 'Job : ',
          text2: medicalRecord.job,
        ),
          GeneralInfoRow(
          text1: 'Marital Status : ',
          text2: medicalRecord.marital_status,
        ),
        GeneralInfoRow(
          text1: 'Sleeping Hours : ',
          text2: medicalRecord.sleeping_hours,
        ),
        GeneralInfoRow(
          text1: 'Sleeping Quality : ',
          text2: medicalRecord.sleeping_quality,
        ),
        GeneralInfoRow(
          text1: 'Past Fracures : ',
          text2: medicalRecord.past_fracrues,
        ),
        /*   GeneralInfoRow(
          text1: 'Father : ',
          text2: medicalRecord.father,
        ),
          GeneralInfoRow(
          text1: 'Mother : ',
          text2: medicalRecord.mother,
        ),
          GeneralInfoRow(
          text1: 'Second Degree : ',
          text2: medicalRecord.second_degree,
        ), */
      ],
    );
  }
}
