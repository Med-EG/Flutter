import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/DoctorViews/SearchForMedicalRecordByID.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';

import '../models/patientInfo without token.dart';

class GetPatientByID {
  Future<PatientInfoWithoutToken> getPatientByID(
    BuildContext context,
  ) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    final String patientID = SearchForMedicalRecordByID().patientID;
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    if (patient == null) {
      Map<String, dynamic>data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/patients/4',
          token: doctor!.token);
      return PatientInfoWithoutToken.fromJson(data);
    } else {
      Map<String, dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/patients/${patient.id}',
          token: patient.token);

      return PatientInfoWithoutToken.fromJson(data);
    }
  }
}
