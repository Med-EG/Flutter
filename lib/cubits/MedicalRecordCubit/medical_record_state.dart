part of 'medical_record_cubit.dart';

abstract class MedicalRecordState {}

class MedicalRecordInitialState extends MedicalRecordState {}
class MedicalRecordLoadingState extends MedicalRecordState {}
class MedicalRecordSuccessState extends MedicalRecordState {
   final MedicalRecordModel? medicalRecord;

  MedicalRecordSuccessState(this.medicalRecord);
}
class MedicalRecordFailureState extends MedicalRecordState {
  final String errMessage;
  MedicalRecordFailureState(this.errMessage);
}

