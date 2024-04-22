import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

class GetPatientByID {
  Future<PatientInfo> getPatientByID(
    BuildContext context,
  ) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

    Map<String, dynamic> data = await Api().get(
        url: 'https://api-medeg.online/api/medEG/patients/${patient!.id}',
        token: patient.token);

    return PatientInfo.fromJson(data);
  }
}
