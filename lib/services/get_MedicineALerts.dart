import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';

import '../models/paitentModel.dart';

class GetAllAlertsService {
  Future<List<MedicineAlertModel>> GetAllAlerts(BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      List<dynamic> data = await Api().get(
        url:
            'https://api-medeg.online/api/medEG/medicine-alert/patient${patient!.id}',
        token: patient.token,
      );

      List<MedicineAlertModel> alerts = [];
      for (int i = 0; i < data.length; i++) {
        alerts.add(MedicineAlertModel.fromJson(data[i]));
      }
      return alerts;
    } catch (e) {
      print('Error fetching appointments: $e');
      // Handle the error here, e.g., return an empty list or show an error message.

      return [];
    }
  }
}
