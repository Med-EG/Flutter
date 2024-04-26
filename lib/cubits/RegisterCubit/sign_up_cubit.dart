import 'package:bloc/bloc.dart';
import 'package:med_eg/helper/API.dart';

import 'package:med_eg/models/paitentModel.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  PatientInfo? patient;
  SignUpCubit() : super(SignUpCubitInitial());
  signUp({required dynamic body, required String url}) async {
    try {
      emit(SignUpCubitLoading());
      final response = await Api().post(url: url, body: body);
      patient = PatientInfo.fromJson(response);
      emit(SignUpCubitSuccess(patient: patient!));
    } catch (response) {
      emit(SignUpCubitFailure(errmessage: 'SomeThing went wrong'));
    }
  }

  passwordVisiblity() {
    emit(ShowPassword());
  }
}
