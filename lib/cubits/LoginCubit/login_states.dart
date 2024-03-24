import 'package:med_eg/models/paitentModel.dart';

class LoginState {}

class InitialState extends LoginState {}

class MissingData extends LoginState {
  final String message;

  MissingData({required this.message});
}

class InvalidData extends LoginState {
  final String message;

  InvalidData({required this.message});
}

class Loading extends LoginState {}

class Success extends LoginState {
  final PaitentInfo paitent;

  Success({required this.paitent});
}
