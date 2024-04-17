import 'package:flutter/material.dart';
import 'package:med_eg/Views/signUp3.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_form_generalInfo.dart';
import '../widgets/custom_button.dart';

class SignUp5 extends StatelessWidget {
  const SignUp5({super.key});
  final String id = 'SignUp5';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'General ',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor)),
                        TextSpan(
                    text: 'medical informations',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: darkBlue)),
                        
              ])),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const CustomFormGeneralInfo(),
                  ],
                )),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomButton(
                text: 'Next',
                color: kPrimaryColor,
                onTap: () {
                  Navigator.pushNamed(context, const SignUp3().id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
