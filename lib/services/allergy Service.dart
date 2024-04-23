import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import '../models/allergyInfoModel.dart';
import 'GetBasicMedicalInfo.dart';
class AllergyInfoForRecordService {
  Future<List<AllergyInfoModel>> getAllergyInfoService(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      MedicalRecordModel medicalRecord = await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/allergy-info/rec/${medicalRecord.medicalId}',
          token: patient!.token);

      List<AllergyInfoModel> allergyList = [];
      for (int i = 0; i < data.length; i++) {
        allergyList.add(AllergyInfoModel.fromJson(data[i]));
      }
      return allergyList;
    } catch (e) {
      print('Error fetching allergies: $e');
      return [];
    }
  }
  Future <void> editAllergyInfoService(BuildContext context, MedicalInfoModel medicine,{
    required String medicineName,
    required String dose,
    required String frequency,
    String? notes,
    int? doctorId
  }) async{
    try{
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      await Api().post(url: 'https://api-medeg.online/api/medEG/medication-info/${medicine.medicineId}', 
      body: {
        'medicine_name': medicineName,
        'dose': dose,
        'frequency': frequency,
        'doctor_id': doctorId.toString(),
        'notes': notes??'null'
      },
      token: patient!.token
      );
    }
    catch(e){
      print('Error fetching medicines: $e');
    }
  }

   Future<void> deleteAllergyInfo({required BuildContext context, required AllergyInfoModel allergyInfoModel}) async {
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