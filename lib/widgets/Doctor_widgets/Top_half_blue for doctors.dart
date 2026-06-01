import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../cubits/LoginCubit/login_cubit.dart';
import '../../models/doctorModel.dart';

class TopHalfBlueForDoctors extends StatelessWidget {
  const TopHalfBlueForDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.4,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(screenWidth, 50),
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.15,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.black,
                ),
                child: ClipOval(
                  child: Image.network(
                    fit: BoxFit.cover,
                    'https://api-medeg.online/${doctor!.doctorImage}',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Dr. ${doctor.doctorFirstName}",
                style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                doctor.specification,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: screenHeight * 0.01),
            ],
          )),
        ),
      ],
    );
  }
}
