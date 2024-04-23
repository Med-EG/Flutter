import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_states.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  PatientInfo? patient;

  login({required dynamic body, required String url}) async {
    try {
      emit(LoginLoading());
       final response = await Api().post(url: url, body: body);
        
      if (Api().errCode==false) {
       patient = PatientInfo.fromJson(response);
        emit(Success(patient: patient!));
        
        
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