import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/constants/texts.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/widgets/DoctorHomePageCardListView.dart';

class DoctorHomeScreen extends StatelessWidget {
   DoctorHomeScreen({super.key});
  final String id = 'DoctorHomeScreen';
   
  @override
  Widget build(BuildContext context) {
    DoctorModel?doctor=BlocProvider.of<LoginCubit>(context).doctor;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32,),
            Image.asset(
              'assets/images/PNG/AppLogo.png',
              height: 50,
            ),
            SizedBox(height: 40,),
            Container(
            width: 100,
            height: 100,
            child: ClipOval(
              child: Image.network(
                fit: BoxFit.cover,
                imagePreText+doctor!.doctorImage,
              ),
            ),),
            SizedBox(height: 30,),
            Row(
              children: [
                Spacer(flex: 1,),
                Text('Hello , DR ',style: TextStyle(fontSize: 20),),
                Text(doctor.doctorFirstName,style: TextStyle(color: Color(0xff407CE2),fontSize: 20,fontWeight: FontWeight.bold),),
                Spacer(flex: 1,),
              ],
            ),
            Expanded(child: DoctorHomePageCardListView()),
          ],
        ),
      ),
    );
  }
}
