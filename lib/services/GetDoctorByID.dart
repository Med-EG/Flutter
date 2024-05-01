import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';

class GetDoctorByID {
  Future<DoctorModelWithoutToken> getDoctorByID(
    BuildContext context,
  ) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
     int? doctorID= BlocProvider.of<MedicalRecordCubit>(context).patientID;
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    
      Map<String, dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/doctor/${doctorID}',
          token: patient!.token);

      return DoctorModelWithoutToken.fromJson(data);
    
  }
}
