import 'package:flutter/material.dart';
import 'package:med_eg/Views/HomeScreen.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/success_signUp.dart';
import '../widgets/custom_text_information.dart';

class SignUp12 extends StatelessWidget {
  const SignUp12({super.key});
  final String id = 'SignUp12';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SuccessSignUp(
                color: 0xff98b3e1, image: 'assets/images/SVG/Stroke 3.svg'),
            CustomTextInformation(text: 'Your medical Record', color: darkBlue),
            CustomTextInformation(text: 'have been Created', color: darkBlue),
            CustomTextInformation(text: 'Successfully', color: kPrimaryColor),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: 'Done',
                color: kPrimaryColor,
                onTap: () {
                  Navigator.pushNamed(context, const HomeScreen().id);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
