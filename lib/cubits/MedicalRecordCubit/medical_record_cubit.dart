import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/medicalRecordModel.dart';
part 'medical_record_state.dart';

class MedicalRecordCubit extends Cubit<MedicalRecordState> {
  MedicalRecordCubit() : super(MedicalRecordLoadingState());
  void satrtLoading()=>emit(MedicalRecordLoadingState());
  void success(MedicalRecordModel medicalRecord)=> emit(MedicalRecordSuccessState(medicalRecord));
  void failure(String errMessage)=> emit(MedicalRecordFailureState(errMessage));
}
