import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import '../customWidgets/custom_arrow_back.dart';
import '../customWidgets/custom_button.dart';
import '../customWidgets/custom_circle_container.dart';
import '../customWidgets/custom_textFormField.dart';
import '../customWidgets/custom_text_information.dart';


class SignUp7 extends StatelessWidget {
  const SignUp7({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
             const Positioned(
                right: -80, top: -80, child: CustomCircleContainer()),
             const Positioned(
                left: -180, bottom: -180, child: CustomCircleContainer()),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomArrowBack(),
                      const CustomTextInformation(
                          text: 'Disease', color: kPrimaryColor),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.075,
                      ),
                      const CustomTextFormField(hint: 'Disease Name'),
                      const CustomTextFormField(
                        hint: 'Disease Description',
                        maxLines: 5,
                      ),
                      const CustomTextFormField(
                        hint: 'Notes',
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: screenHeight * 0.15,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: kPrimaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, '/signUp8');
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
