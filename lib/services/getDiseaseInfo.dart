import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/diseaseInfoModel.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'GetBasicMedicalInfo.dart';

class GetDiseaseInfoForRecord {
  Future<List<DiseaseInfoModel>> getDiseaseInfo(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      MedicalRecordModel medicalRecord = await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/disease-info/rec/${medicalRecord.medicalId}',
          token: patient!.token);

      List<DiseaseInfoModel> diseaseList = [];
      for (int i = 0; i < data.length; i++) {
        diseaseList.add(DiseaseInfoModel.fromJson(data[i]));
      }
      return diseaseList;
    } catch (e) {
      print('Error fetching medicines: $e');
      return [];
    }
  }
}