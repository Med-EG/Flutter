import 'package:flutter/material.dart';
import 'package:med_eg/Views/faqs_screen.dart';
import 'package:med_eg/Views/profile03.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/services/Log%20Out%20service.dart';
import 'package:med_eg/widgets/custom_button.dart';
import '../widgets/top_half_blue.dart';
import 'chooseUserType.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});
  final String id = 'PatientProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const TopHalfBlueScreen(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(
            text: 'Edit Profile',
            color: kPrimaryColor,
            onTap: () {
              Navigator.pushNamed(context, const SignUp2().id);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(
            text: 'General medical info.',
            color: kPrimaryColor,
            onTap: () {
              Navigator.pushNamed(context, const Profile03().id);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(
            text: 'FAQs',
            color: kPrimaryColor,
            onTap: () {
              Navigator.pushNamed(context, const FAQSScreen().id);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomButton(
              onTap: () async {
                bool loggedOut = await LogOutService().patientLogOut(context);
                if (loggedOut) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamedAndRemoveUntil(
                      context, const ChooseUserType().id, (route) => false);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'No internet connection or server error. Please try again later.'),
                  ));
                }
              },
              text: 'Log out',
              color: Colors.red),
        ),
      ],
    ));
  }
}
