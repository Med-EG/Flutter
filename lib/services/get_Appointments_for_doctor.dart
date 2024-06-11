import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/appointmentModelForDoctorSide.dart';
import 'package:med_eg/models/doctorAssistantModel.dart';
import 'package:med_eg/models/doctorModel.dart';

class GetAllAppointmentForDoctorService {
  Future<List<AppointmentModelForDoctorSide>> GetAllAppontmentsDoctor(
      BuildContext context) async {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    DoctorAssistant? assistant = BlocProvider.of<LoginCubit>(context).assistant;
    try {
      if (assistant == null) {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/appointments/doctor/${doctor!.id}',
            token: doctor.token);

        List<AppointmentModelForDoctorSide> appointmentList = [];
        for (int i = 0; i < data.length; i++) {
          appointmentList.add(AppointmentModelForDoctorSide.fromJson(data[i]));
        }
        return appointmentList;
      } else {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/appointments/doctor/${assistant.doctorID}',
            token: assistant.token);

        List<AppointmentModelForDoctorSide> appointmentList = [];
        for (int i = 0; i < data.length; i++) {
          appointmentList.add(AppointmentModelForDoctorSide.fromJson(data[i]));
        }
        return appointmentList;
      }
    } catch (e) {
      print('Error fetching appointments: $e');
      // Handle the error here, e.g., return an empty list or show an error message.
      // List<AppointmentModel> data=[];
      return [];
    }
  }
}
