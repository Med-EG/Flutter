import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/DoctorWorkingDaysModel.dart';
import 'package:med_eg/models/doctorAssistantModel.dart';
import 'package:med_eg/models/doctorModel.dart';

class GetWorkingDaysForDoctorService {
  Future<List<WorkingDaysModel>> getWorkingDaysForDoctor(
      BuildContext context) async {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    DoctorAssistant? assistant = BlocProvider.of<LoginCubit>(context).assistant;
    if (assistant == null) {
      try {
        List<dynamic> data = await Api().get(
          url: 'https://api-medeg.online/api/medEG/day/doctor/${doctor!.id}',
          token: doctor.token
        );

        List<WorkingDaysModel> workingDays = [];
        for (int i = 0; i < data.length; i++) {
          workingDays.add(WorkingDaysModel.fromJson(data[i]));
        }
        return workingDays;
      } catch (e) {
        print('Error fetching appointments: $e');
        // Handle the error here, e.g., return an empty list or show an error message.
        return [];
      }
    } else {
      try {
        List<dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/day/doctor/${assistant.doctorID}',
              token: assistant.token
        );

        List<WorkingDaysModel> workingDays = [];
        for (int i = 0; i < data.length; i++) {
          workingDays.add(WorkingDaysModel.fromJson(data[i]));
        }
        return workingDays;
      } catch (e) {
        print('Error fetching appointments: $e');
        // Handle the error here, e.g., return an empty list or show an error message.
        return [];
      }
    }
  }
}
