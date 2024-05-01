// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';

import '../models/medicalRecordModel.dart';

class EditMedicalRecord {
  Future<MedicalRecordModel> editMedicalInfo(BuildContext context,
      {
      required int height,
      required int weight,
      required String blood_type,
      required bool alcoholic,
      required String alcoholic_level,
      required bool smoker,
      required String smoking_level,
      required String job,
      required String marital_status,
      String? past_fracrues,
      String? sleeping_hours,
      String? sleeping_quality,
      required String father,
      required String mother,
      String? second_degree}) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;
    final int patientIDD= BlocProvider.of<MedicalRecordCubit>(context).patientIDGetByDoctorSearch;
       if(doctor==null){
      Map<String, dynamic> data = await Api().put(
          url: 'https://api-medeg.online/api/medEG/record/${patient!.medicalRecordID}',
          body: {
            'height':height,
            'weight':weight,
            'blood_type':blood_type,
            'alcoholic':alcoholic,
            'alcoholic_level':alcoholic_level,
            'smoker':smoker,
            'smoking_level':smoking_level,
            'job':job,
            'marital_status':marital_status,
            'past_fracrues':past_fracrues,
            'sleeping_hours':sleeping_hours,
            'sleeping_quality':sleeping_quality,
            'father':father,
            'mother':mother,
            'second_degree':second_degree
          },
          token: patient.token);
      return MedicalRecordModel.fromJson(data);
       }
       else
       {
        Map<String, dynamic> data = await Api().put(
          url: 'https://api-medeg.online/api/medEG/record/${patientIDD.toString()}',
          body: {
            'height':height,
            'weight':weight,
            'blood_type':blood_type,
            'alcoholic':alcoholic,
            'alcoholic_level':alcoholic_level,
            'smoker':smoker,
            'smoking_level':smoking_level,
            'job':job,
            'marital_status':marital_status,
            'past_fracrues':past_fracrues,
            'sleeping_hours':sleeping_hours,
            'sleeping_quality':sleeping_quality,
            'father':father,
            'mother':mother,
            'second_degree':second_degree
          },
          token: doctor.token);
      return MedicalRecordModel.fromJson(data);
       }
    } catch (e) {
      print('Error fetching records: $e');
      rethrow;
    }
  }
}
