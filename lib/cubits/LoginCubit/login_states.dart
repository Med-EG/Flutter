import 'package:med_eg/models/paitentModel.dart';

class LoginState {}

class InitialState extends LoginState {}

class InvalidData extends LoginState {
  final String message;

  InvalidData({required this.message});
}

class LoginLoading extends LoginState {}

class Success extends LoginState {
  
  final PatientInfo patient; 

  Success({required this.patient});
}

class ShowPassword extends LoginState {}