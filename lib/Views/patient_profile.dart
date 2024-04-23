import 'package:flutter/material.dart';
import 'package:med_eg/Views/faqs_screen.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_button.dart';
import '../widgets/top_half_blue.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});
final String id = 'PatientProfile';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
      children: [
        const TopHalfBlueScreen(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(text: 'Edit Profile', color: kPrimaryColor,
          onTap: () {
            Navigator.pushNamed(context, const SignUp2().id);
          },),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child:
              CustomButton(text: 'General medical info.', color: kPrimaryColor),
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
