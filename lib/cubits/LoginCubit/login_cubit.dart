import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_states.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

class LoginCubit extends Cubit<LoginState> {
  
  LoginCubit() : super(InitialState());

  PaitentInfo ?paitent;  
  
  login({required String email, required String password}) async {
    try {
      final response = await Api().post(
          url: 'https://api-medeg.online/medEG/patient/login',
          body: {'email': email, 'password': password});
      paitent = PaitentInfo.fromJson(response);
      if (paitent != null) {
        emit(Success(paitent: paitent!));
      } else if(email==null){
        emit(MissingData(message:'Fill all the fields please'));
      }
    } catch (responce) {
      emit(InvalidData(message: 'email or password is wrong'));
    }
  }
}
