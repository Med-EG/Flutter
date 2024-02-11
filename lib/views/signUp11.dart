import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';
import 'package:med_eg/widgets/custom_textFormField.dart';
import 'package:med_eg/widgets/custom_text_information.dart';

class SignUp11 extends StatelessWidget {
  const SignUp11({super.key});

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
                          text: 'Relatives', color: blue),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.15,
                      ),
                      const CustomTextFormField(hint: 'Degree Of Relativity'),
                      const CustomTextFormField(
                        hint: 'Genetic Diseases',
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: screenHeight * 0.21,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: blue,
                        onTap: () {
                          Navigator.pushNamed(context, '/signUp12');
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
