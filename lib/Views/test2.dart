import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/paitentModel.dart';

class Test2 extends StatelessWidget {
   Test2({super.key});
  final id = 'Test2';
  final String medicineName='8';
  final String dose='6'; 
   final String idd='10'; 
    var test=Api();
  @override
  Widget build(BuildContext context) {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
             test.post(
                url: 'https://api-medeg.online/api/medEG/appointment',
                token: patient!.token,
                body: {
                  'patient_id': patient.id.toString(),
                  'doctor_id': idd,
                  'working_hour_id':dose ,
                  'working_day_id':medicineName ,
                }
                 );
          },
          child: Container(
            color: Colors.black38,
            child: Text('data'),
          ),
        ),
      ),
    );
  }
}
