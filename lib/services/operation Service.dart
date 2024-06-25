import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/operationInfoModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'GetBasicMedicalInfo.dart';

class OperationInfoForRecordService {
  Future<List<OperationInfoModel>> getOperationInfoService(
      BuildContext context) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      MedicalRecordModel medicalRecord =
          await GetBasicMedicalInfo().getBasicMedicalInfo(context);
      if (doctor == null) {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/operation-info/rec/${medicalRecord.medicalId}',
            token: patient!.token);

        List<OperationInfoModel> operationList = [];
        for (int i = 0; i < data.length; i++) {
          operationList.add(OperationInfoModel.fromJson(data[i]));
        }
        return operationList;
      } else {
        List<dynamic> data = await Api().get(
            url:
                'https://api-medeg.online/api/medEG/operation-info/rec/${medicalRecord.medicalId}',
            token: doctor.token);

        List<OperationInfoModel> operationList = [];
        for (int i = 0; i < data.length; i++) {
          operationList.add(OperationInfoModel.fromJson(data[i]));
        }
        return operationList;
      }
    } catch (e) {
      print('Error fetching operations: $e');
      return [];
    }
  }

  Future<void> editAllergyInfoService(
      BuildContext context, MedicalInfoModel medicine,
      {required String medicineName,
      required String dose,
      required String frequency,
      String? notes,
      int? doctorId}) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      await Api().post(
          url:
              'https://api-medeg.online/api/medEG/medication-info/${medicine.medicineId}',
          body: {
            'medicine_name': medicineName,
            'dose': dose,
            'frequency': frequency,
            'doctor_id': doctorId.toString(),
            'notes': notes ?? 'null'
          },
          token: patient?.token ?? doctor?.token);
    } catch (e) {
      print('Error fetching medicines: $e');
    }
  }

  Future<void> deleteOperationInfo(
      {required BuildContext context,
      required OperationInfoModel operationInfoModel}) async {
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;

      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;

      await Api().delete(
          url:
              'https://api-medeg.online/api/medEG/allergy-info/${operationInfoModel.operationId}',
          token: patient?.token ?? doctor?.token);
    } catch (e) {
      print('Error fetching operations: $e');
    }
  }
}
