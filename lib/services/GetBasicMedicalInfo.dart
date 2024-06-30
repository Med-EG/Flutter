import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import '../models/medicalRecordModel.dart';
class GetBasicMedicalInfo {
  Future<MedicalRecordModel> getBasicMedicalInfo(BuildContext context) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    int? patientIDD =
        BlocProvider.of<MedicalRecordCubit>(context).patientIDGetByDoctorSearch;

    // Define retry parameters for exponential backoff
    const int maxRetries = 5;
    const Duration initialRetryDelay = Duration(seconds: 1);
     const Duration maxRetryDelay = Duration(minutes: 1);
    int retries = 0;
    Duration retryDelay = initialRetryDelay;

    while (true) {
      try {
        // Determine URL and token based on whether the user is a doctor or patient
        String url;
        String token;

        if (doctor == null) {
          url = 'https://api-medeg.online/api/medEG/record/${patient!.medicalRecordID}';
          token = patient.token;
        } else {
          url = 'https://api-medeg.online/api/medEG/record/$patientIDD';
          token = doctor.token;
        }

        // Make the API call
        Map<String, dynamic> data = await Api().get(url: url, token: token);

        // Return parsed MedicalRecordModel if successful
        return MedicalRecordModel.fromJson(data);
      } catch (e) {
        // Handle specific HTTP status codes here
        if (e is ApiException && e.statusCode == 429) {
          if (retries < maxRetries) {
            // Increment retry count and exponentially increase delay
            retries++;
            await Future.delayed(retryDelay);
            retryDelay = retryDelay * 2 < maxRetryDelay ? retryDelay * 2 : maxRetryDelay; // Exponential backoff
          } else {
            // Max retries reached, throw the exception
            throw Exception('Max retries exceeded: ${e.toString()}');
          }
        } else {
          // Rethrow other exceptions
          rethrow;
        }
      }
    }
  }
}



/* class GetBasicMedicalInfo {
  Future<MedicalRecordModel> getBasicMedicalInfo(
    BuildContext context,
  ) async {
    try{
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;
     int? patientIDD= BlocProvider.of<MedicalRecordCubit>(context).patientIDGetByDoctorSearch;
     const int maxRetries = 3;
     const Duration initialRetryDelay = Duration(seconds: 1);
     int retries = 0;
     Duration retryDelay = initialRetryDelay;
    if(doctor==null){
    Map<String,dynamic> data = await Api().get(
      
        url: 'https://api-medeg.online/api/medEG/record/${patient!.medicalRecordID}',
        token: patient.token);

    return MedicalRecordModel.fromJson(data);}
    else{
      Map<String,dynamic> data = await Api().get(
      
        url: 'https://api-medeg.online/api/medEG/record/$patientIDD',
        token: doctor.token);
        return MedicalRecordModel.fromJson(data);

    }
    }
    catch(e){
      print(e.toString());
      rethrow;
    }
  }
} */