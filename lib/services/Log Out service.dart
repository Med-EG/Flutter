import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';

import '../cubits/LoginCubit/login_cubit.dart';
import '../helper/API.dart';

class LogOutService {
  Future<bool> patientLogOut(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      await Api().post(
        url: 'https://api-medeg.online/api/medEG/patient/logout',
        body: {},
        token: patient!.token,
      );
      return true; // Logout was successful
    } catch (e) {
      print('Error logging out: $e');
      return false; // Logout failed
    }
  }
   Future<bool> doctorLogOut(BuildContext context) async {
    try {
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      await Api().post(
        url: 'https://api-medeg.online/api/medEG/doctor/logout',
        body: {},
        token: doctor!.token,
      );
      return true; // Logout was successful
    } catch (e) {
      print('Error logging out: $e');
      return false; // Logout failed
    }
  }
}