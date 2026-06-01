import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../helper/API.dart';
import '../../models/doctorModel.dart';
import '../../models/medicalInfo.dart';
import '../../models/medicalRecordModel.dart';
import '../../models/paitentModel.dart';
import '../../services/GetBasicMedicalInfo.dart';
import '../LoginCubit/login_cubit.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitial());
  Future<void> fetchMedicineInfo(BuildContext context) async {
    emit(MedicineLoading());
    try {
      PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      MedicalRecordModel medicalRecord =
          await GetBasicMedicalInfo().getBasicMedicalInfo(context);

      List<dynamic> data;
      if (doctor == null) {
        data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/medication-info/rec/${medicalRecord.medicalId}',
          token: patient!.token,
        );
      } else {
        data = await Api().get(
          url:
              'https://api-medeg.online/api/medEG/medication-info/rec/${medicalRecord.medicalId}',
          token: doctor.token,
        );
      }

      List<MedicalInfoModel> medicineList = [];
      for (int i = 0; i < data.length; i++) {
        medicineList.add(MedicalInfoModel.fromJson(data[i]));
      }
      emit(MedicineSuccess(medicineList: medicineList)); // Update state with fetched medicine list
    } catch (e) {
      emit(MedicineFailure(errMessage: 'Error fetching medicines: $e'));
    }
  }
}
