import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';

import '../../helper/API.dart';
import '../../models/doctorModel.dart';

class EditDoctorInfo {
  Future<DoctorModelWithoutToken> editDoctorBasicInfo(
    BuildContext context, {
    required String drfirstName,
    required String drLastName,
    required String email,
    required int password,
    required String gender,
    required String specialization,
    required String education,
    required int licenceId,
    required String country,
    required String city,
    required String street,
    required String scientificDegree,
    required int price,
  }) async {
    try {
        DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      final response = await Api().put(
          url: 'https://api-medeg.online/api/medEG/doctor/${doctor!.doctorId}',
          body: {
            'first_name': drfirstName,
            'last_name': drLastName,
            'email': email,
            'password': password,
            'gender': gender,
            'specialization': specialization,
            'education': education,
            'license_id': licenceId,
            'country': country,
            'city': city,
            'street': street,
            'scientific_degree': scientificDegree,
            'price': price,
          },
          token: doctor.token);
      final editBasicInfo = DoctorModelWithoutToken.fromJson(response);
      return editBasicInfo;
    } catch (e) {
      print('Error sending message: $e');
      throw e;
    }
  }
}
