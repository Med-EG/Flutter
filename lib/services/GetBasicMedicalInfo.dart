import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/DoctorViews/SearchForMedicalRecordByID.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';

import '../models/medicalRecordModel.dart';

class GetBasicMedicalInfo {
  Future<MedicalRecordModel> getBasicMedicalInfo(
    BuildContext context,
  ) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;
     int? patientIDD= BlocProvider.of<MedicalRecordCubit>(context).patientIDGetByDoctorSearch;
    if(doctor==null){
    Map<String,dynamic> data = await Api().get(
      
        url: 'https://api-medeg.online/api/medEG/record/${patient!.id}',
        token: patient.token);

    return MedicalRecordModel.fromJson(data);}
    else{
      Map<String,dynamic> data = await Api().get(
      
        url: 'https://api-medeg.online/api/medEG/record/${patientIDD.toString()}',
        token: doctor.token);
        return MedicalRecordModel.fromJson(data);

    }
  }
}
