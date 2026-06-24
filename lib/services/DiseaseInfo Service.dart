import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/diseaseInfoModel.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'GetBasicMedicalInfo.dart';

class DiseaseInfoForRecord {
  Future<List<DiseaseInfoModel>> getDiseaseInfo(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      MedicalRecordModel medicalRecord =
          await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      if (doctor == null) {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/disease-info/rec/${medicalRecord.medicalId}',
            token: patient!.token);
        List<DiseaseInfoModel> diseaseList = [];
        for (int i = 0; i < data.length; i++) {
          diseaseList.add(DiseaseInfoModel.fromJson(data[i]));
        }
        return diseaseList;
      } else {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/disease-info/rec/${medicalRecord.medicalId}',
            token: doctor.token);
        List<DiseaseInfoModel> diseaseList = [];
        for (int i = 0; i < data.length; i++) {
          diseaseList.add(DiseaseInfoModel.fromJson(data[i]));
        }
        return diseaseList;
      }
    } catch (e) {
      print('Error fetching diseases: $e');
      return [];
    }
  }

  Future<DiseaseInfoModel> createDisease(
    BuildContext context, {
    required int medicalIdd,
    required String diseaseNamee,
  }) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      final response = await Api().post(
          url: 'https://api-medeg.online/api/medEG/disease-info',
          body: {
            'medical_record_id': medicalIdd.toString(),
            'disease_name': diseaseNamee,
          },
          token: patient!.token);
      final disease = DiseaseInfoModel.fromJson(response);
      return disease;
    } catch (e) {
      print('Error creating Disease: $e');
      throw e;
    }
  }
    Future<void> deleteDiseaseInfo(
      {required BuildContext context,
      required DiseaseInfoModel diseaseInfoModel}) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      await Api().delete(
          url:
              'https://api-medeg.online/api/medEG/disease-info/${diseaseInfoModel.diseaseId}',
          token: patient!.token);
    } catch (e) {
      print('Error fetching medicines: $e');
    }
  }
}
