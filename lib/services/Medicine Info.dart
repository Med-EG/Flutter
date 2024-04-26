import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'GetBasicMedicalInfo.dart';
class MedicineInfoForRecordService {
  Future<List<MedicalInfoModel>> getMedicineInfoService(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;
      MedicalRecordModel medicalRecord =  await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      if(doctor==null){
      List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/medication-info/rec/${medicalRecord.medicalId}',
          token: patient!.token);

      List<MedicalInfoModel> medicineList = [];
      for (int i = 0; i < data.length; i++) {
        medicineList.add(MedicalInfoModel.fromJson(data[i]));
      }
      return medicineList;}
      else{
        List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/medication-info/rec/${medicalRecord.medicalId}',
          token: doctor.token);

      List<MedicalInfoModel> medicineList = [];
      for (int i = 0; i < data.length; i++) {
        medicineList.add(MedicalInfoModel.fromJson(data[i]));
      }
      return medicineList;}

      
    } catch (e) {
      print('Error fetching medicines: $e');
      return [];
    }
  }
  Future <void> editMedicineInfoService(BuildContext context, MedicalInfoModel medicine,{
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

   Future<void> deleteMedicineInfo({required BuildContext context, required MedicalInfoModel medicalInfoModel}) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

     await Api().delete(
          url:
              'https://api-medeg.online/api/medEG/medication-info/${medicalInfoModel.medicineId}',
          token: patient!.token);
    } catch (e) {
      print('Error fetching medicines: $e');
    }
  }
}