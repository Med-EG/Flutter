import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

class GetAllALertsTimesService{
  
  Future<List<String>> GetAllLertsTimes(BuildContext context) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    try {
  List<dynamic> data = await Api().get(url: 'https://api-medeg.online/api/medEG/alert-times/patient/${patient!.id}',token: patient.token);
  
  List<String> times = [];
  for (int i = 0; i < data.length; i++) {
    times.add(data[i]);
  } 
  return times;
} catch (e) {
  print('Error fetching appointments: $e');
      // Handle the error here, e.g., return an empty list or show an error message.
     // List<AppointmentModel> data=[];
      return [];
}
  }
}