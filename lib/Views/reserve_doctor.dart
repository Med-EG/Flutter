import 'package:flutter/material.dart';
import 'package:med_eg/Views/check_reservation.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import '../models/doctorModel without token.dart';
import '../widgets/days_view.dart';
import '../widgets/find_doctor_card.dart';

class ReserveDoctor extends StatelessWidget {
  const ReserveDoctor({super.key, required this.doctor});
  static const String id = 'ReserveDoctor';
  final DoctorModelWithoutToken doctor;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomArrowBack(),
              FindDoctorCard(doctor: doctor,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                  style: TextStyle(
                      fontSize: 12, color: grey, fontWeight: FontWeight.w500),
                ),
              ),
              DaysView(screenHeight: screenHeight, screenWidth: screenWidth),
              // TimeView(screenHeight: screenHeight, screenWidth: screenWidth), 
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    text: 'Book Appointment',
                    color: kPrimaryColor,
                    onTap: () {
                      Navigator.pushNamed(context, const CheckReservation().id);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
