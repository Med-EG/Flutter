part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpCubitState {}

class SignUpCubitInitial extends SignUpCubitState {}

class SignUpCubitLoading extends SignUpCubitState {}

class SignUpCubitMissingData extends SignUpCubitState {}

class SignUpCubitFailure extends SignUpCubitState {
  final String errmessage;

  SignUpCubitFailure({required this.errmessage});
}

class SignUpCubitSuccess extends SignUpCubitState {
  final PatientInfo patient;

  SignUpCubitSuccess({required this.patient});
}

class ShowPassword extends SignUpCubitState {}
class PasswordValidation extends SignUpCubitState {
  final bool isValid;

  PasswordValidation(this.isValid);
}
