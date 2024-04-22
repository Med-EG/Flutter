import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/paitentModel.dart';

import 'GetBasicMedicalInfo.dart';

class GetMedicineInfoForRecord {
  Future<List<MedicalInfoModel>> getMedicineInfo(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      MedicalRecordModel medicalRecord = await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/medication-info/rec/${medicalRecord.medicalId}',
          token: patient!.token);

      List<MedicalInfoModel> medicineList = [];
      for (int i = 0; i < data.length; i++) {
        medicineList.add(MedicalInfoModel.fromJson(data[i]));
      }
      return medicineList;
    } catch (e) {
      print('Error fetching medicines: $e');
      return [];
    }
  }
}