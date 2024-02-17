import 'package:flutter/material.dart';
import 'package:med_eg/Views/signUp6.dart';
import 'package:med_eg/constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';


class SignUp7 extends StatelessWidget {
  const SignUp7({super.key});
final String id = 'signUp7';
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
                      const CustomTextFormField(label: 'Disease Name'),
                      const CustomTextFormField(
                        label: 'Disease Description',
                        maxLines: 5,
                      ),
                      const CustomTextFormField(
                        label: 'Notes',
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: screenHeight * 0.15,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: kPrimaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, const SignUp6().id);
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
