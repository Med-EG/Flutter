import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import '../models/allergyInfoModel.dart';
import 'GetBasicMedicalInfo.dart';

class AllergyInfoForRecordService {
  Future<List<AllergyInfoModel>> getAllergyInfoService(
      BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;

      MedicalRecordModel medicalRecord =
          await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      if (doctor == null) {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/allergy-info/rec/${medicalRecord.medicalId}',
            token: patient!.token);

        List<AllergyInfoModel> allergyList = [];
        for (int i = 0; i < data.length; i++) {
          allergyList.add(AllergyInfoModel.fromJson(data[i]));
        }
        return allergyList;
      } else {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/allergy-info/rec/${medicalRecord.medicalId}',
            token: doctor.token);

        List<AllergyInfoModel> allergyList = [];
        for (int i = 0; i < data.length; i++) {
          allergyList.add(AllergyInfoModel.fromJson(data[i]));
        }
        return allergyList;
      }
    } catch (e) {
      print('Error fetching allergies: $e');
      return [];
    }
  }

  Future<void> updateAllergyInfoService(
    BuildContext context, {
    required String allergyName,
    required String allergyType,
    required MedicalRecordModel medicalRecordId, AllergyInfoModel? allergy,
  }) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      await Api().put(
          url:
              'https://api-medeg.online/api/medEG/allergy-info/${allergy!.allergyId}',
          body: {
            'allergy_name': allergyName,
            'medical_record_id': medicalRecordId,
            'allergy_type': allergyType,
          },
          token: patient!.token);
    } catch (e) {
      print('Error fetching allergies: $e');
    }
  }

  Future<void> deleteAllergyInfo(
      {required BuildContext context,
      required AllergyInfoModel allergyInfoModel}) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      await Api().delete(
          url:
              'https://api-medeg.online/api/medEG/allergy-info/${allergyInfoModel.allergyId}',
          token: patient!.token);
    } catch (e) {
      print('Error fetching allergies: $e');
    }
  }
}
