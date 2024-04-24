import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

import '../models/patientInfo without token.dart';

class GetPatientByID {
  Future<PatientInfoWithoutToken> getPatientByID(
    BuildContext context,
  ) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

    Map<String, dynamic> data = await Api().get(
        url: 'https://api-medeg.online/api/medEG/patients/${19}',
        token: patient!.token);

    return PatientInfoWithoutToken.fromJson(data);
  }
}
