
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
import 'package:med_eg/models/paitentModel.dart';

class GetAllDoctorService {
  Future<List<DoctorModelWithoutToken>> GetAllDoctors(BuildContext context) async {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    List<dynamic> data = await Api().get(url: 'https://api-medeg.online/api/medEG/doctor', token: patient!.token);
    
    List<DoctorModelWithoutToken> doctorCardList = [];
    for (int i = 0; i < data.length; i++) {
      doctorCardList.add(DoctorModelWithoutToken.fromJson(data[i]));
    }
    return doctorCardList;
  }
}
