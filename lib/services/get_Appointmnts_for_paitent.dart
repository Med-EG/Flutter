
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/appointmentModel.dart';
import 'package:med_eg/models/paitentModel.dart';

class GetAllAppointmentService {
  Future<List<AppointmentModel>> GetAllAppontmentsForPatient(BuildContext context) async {
    try {
  PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
  List<dynamic> data = await Api().get(url: 'https://api-medeg.online/api/medEG/appointment/patient/${patient!.id}', token: patient.token);
  
  List<AppointmentModel> appointmentList = [];
  for (int i = 0; i < data.length; i++) {
    appointmentList.add(AppointmentModel.fromJson(data[i]));
  }
  return appointmentList;
} catch (e) {
  print('Error fetching appointments: $e');
      // Handle the error here, e.g., return an empty list or show an error message.
     // List<AppointmentModel> data=[];
      return [];
}
  }
}
