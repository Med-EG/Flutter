import 'package:flutter/material.dart';
import 'package:med_eg/Views/DoctorViews/edit%20basic%20info%20for%20doctor.dart';
import 'package:med_eg/Views/faqs_screen.dart';
import 'package:med_eg/Views/profile03.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_button.dart';
import '../../widgets/Doctor_widgets/Top_half_blue for doctors.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});
final String id = 'DoctorProfile';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
      children: [
        const TopHalfBlueForDoctors(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(text: 'Edit Profile', color: kPrimaryColor,
          onTap: () {
            Navigator.pushNamed(context, const EditBasicInfoForDoctor().id);
          },),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(text: 'Edit Working Days & Time', color: kPrimaryColor,
          onTap: () {
            //Navigator.pushNamed(context, const SignUp2().id);
          },),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
              CustomButton(text: 'General medical info.', color: kPrimaryColor,
             onTap: () {
               Navigator.pushNamed(context, const Profile03().id);
             },
              ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(text: 'FAQs', color: kPrimaryColor,
           onTap: () {
            Navigator.pushNamed(context, const FAQSScreen().id);
          },),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(text: 'Log out', color: Colors.red),
        ),
      ],
    ));
  }
}
