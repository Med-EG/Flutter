import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';

class SignUp10 extends StatelessWidget {
  const SignUp10({super.key});

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
                          text: 'Operation', color: blue),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      const CustomTextFormField(hint: 'Operation Name'),
                      const CustomTextFormField(
                        hint: 'Surgeon Name',
                      ),
                      CustomTextFormField(
                        hint: 'Operation Date',
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_month)),
                      ),
                      const CustomTextFormField(
                          hint: 'Complications', maxLines: 2),
                      const CustomTextFormField(hint: 'Notes', maxLines: 3),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: blue,
                        onTap: () {
                          Navigator.pushNamed(context, '/signUp11');
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
