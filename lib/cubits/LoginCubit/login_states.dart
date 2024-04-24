
import '../../models/doctorModel.dart';
import '../../models/paitentModel.dart';

class LoginState {}

class InitialState extends LoginState {}

class InvalidData extends LoginState {
  final String message;

  InvalidData({required this.message});
}

class LoginLoading extends LoginState {}

class SuccessPatient extends LoginState {
  
  final PatientInfo patient; 

  SuccessPatient({required this.patient});
}

class SuccessDoctor extends LoginState {
  
  final DoctorModel doctor; 

  SuccessDoctor({required this.doctor});
}

class ShowPassword extends LoginState {}