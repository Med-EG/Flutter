import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';

import '../../cubits/LoginCubit/login_cubit.dart';
import '../../helper/API.dart';
import '../../models/doctorModel.dart';

class GetDoctorService {
  Future<DoctorModelWithoutToken> getDoctorInfo(BuildContext context) async {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;

    Map<String, dynamic> data = await Api().get(
        url: 'https://api-medeg.online/api/medEG/record/${doctor!.doctorId}',
        token: doctor.token);
    return DoctorModelWithoutToken.fromJson(data);
  }
}
