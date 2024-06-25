import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/AppointmentModelForCheckAvailability.dart';
import 'package:med_eg/models/doctorAssistantModel.dart';

class CheckAppointmentAvailabilityService {
  final String dateToCheck;
  final String timeToCheck;

  CheckAppointmentAvailabilityService(
      {required this.dateToCheck, required this.timeToCheck});

  Future<List<AppointmentModelForCheckAvailability>> getAppointmentsInADay(
      BuildContext context) async {
    DoctorAssistant? assistant = BlocProvider.of<LoginCubit>(context).assistant;

    // Fetch data from the API
    Map<String, dynamic>? responseData = await Api().post(
      url: 'https://api-medeg.online/api/medEG/check-availability',
      body: {"doctor_id": assistant!.doctorID, "appointment_date": dateToCheck},
      token: assistant.token,
    );

    // Check if responseData is null or if it doesn't contain the key "appointments"
    if (responseData == null || !responseData.containsKey("appointments")) {
      print('Error: Invalid API response');
      return [];
    }

    // Get the list of appointments from the responseData
    List<dynamic> appointmentDataList = responseData["appointments"];

    // Initialize list of appointments
    List<AppointmentModelForCheckAvailability> appointments = [];

    // Iterate over appointmentDataList and convert to AppointmentModelForCheckAvailability objects
    for (int i = 0; i < appointmentDataList.length; i++) {
      appointments.add(AppointmentModelForCheckAvailability.fromJson(
          appointmentDataList[i]));
    }

    return appointments;
  }

  Future<bool> checkAppointmentAvailability(BuildContext context) async {
    List<AppointmentModelForCheckAvailability> appointments =
        await getAppointmentsInADay(context);
   
    for (AppointmentModelForCheckAvailability appointment in appointments) {
      if (appointment.date == dateToCheck && appointment.time == timeToCheck) {
        return false;
      }
    }

    return true;
  }
}
