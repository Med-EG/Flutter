import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_states.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorAssistantModel.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/paitentModel.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  PatientInfo? patient;
  DoctorModel? doctor;
  DoctorAssistant? assistant;

  int x = 0;
  login({required dynamic body, required String url}) async {
    try {
      emit(LoginLoading());
      final response = await Api().post(url: url, body: body);

      if (Api().errCode == false) {
        if (2 == x) {
          doctor = DoctorModel.fromJson(response);
          emit(SuccessDoctor(doctor: doctor!));
        } else if (1 == x) {
          patient = PatientInfo.fromJson(response);
          emit(SuccessPatient(patient: patient!));
        } else if (3 == x) {
          assistant = DoctorAssistant.fromJson(response);
          emit(SuccessDoctorAssistant(assistant: assistant!));
        }
      } else {
        emit(InvalidData(message: 'Email or password is invalid !'));
      }
    } catch (responce) {
      emit(InvalidData(message: 'something went wrong'));
    }
  }

  PasswordVisabilty() {
    emit(ShowPassword());
  }
}
