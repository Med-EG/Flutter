import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'package:med_eg/services/get_MedicineALerts.dart';
import 'package:med_eg/widgets/customHalfTextFieldHalfDropDown.dart';
import 'package:meta/meta.dart';
part 'medicine_alert_state.dart';
class MedicineAlertCubit extends Cubit<MedicineAlertState> {
  MedicineAlertCubit() : super(MedicineAlertInitial());

  GetAllAlertsService alerts = GetAllAlertsService();
  MedicineAlertModel? _medicineAlertModel;
  CreateNewMedicineALert(
      {required String patientToken,
      required dynamic body,
      required String url,required List<String>times}) async {
    try {
      emit(Loading());

      final response =
          await Api().post(url: url, body: body, token: patientToken);
      _medicineAlertModel = MedicineAlertModel.fromJson(response);
      CreateNewMedicineALertTime;
    for(int i=0;i<times.length;i++){
       await Api().post(url: 'https://api-medeg.online/api/medEG/alert-times', body:{'alertTime': times[i]} ,token: patientToken);
    }
    } catch (e) {}
  }

  CreateNewMedicineALertTime(
      {required String patientToken,
      required String alertTime,
      required String url}) async {
    emit(Loading());
    await Api().post(
        url: url,
        body: {
          'alert_time': alertTime,
          'alert_id': _medicineAlertModel!.alertID
        },
        token: patientToken);
  }

  GetAllAlerts() {
    Future<List<MedicineAlertModel>> GetAllAlerts(BuildContext context) async {
      try {
        PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
        Map<String,dynamic> data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/medicine-alert/patient${patient!.id}',
          token: patient.token,
        );

        List<MedicineAlertModel> alerts = [];
        for (int i = 0; i < data.length; i++) {
          alerts.add(MedicineAlertModel.fromJson(data[i]));
        }
        emit(ShowAllMedicineAlerts(medicines: alerts));
        return alerts;
      } catch (e) {
        print('Error fetching appointments: $e');
        // Handle the error here, e.g., return an empty list or show an error message.

        emit(NoAlertsToShow());
        return [];
      }
    }
  }

  // ignore: non_constant_identifier_names
  CreateNewTimeTextField({
    required Function(String) onDataEntered,
}) {
  emit(AddNewTimetextField());
    return HalfTextFieldHalfDropDown(
        isItDoseTextField: false, onDataEntered: onDataEntered);
}

}
