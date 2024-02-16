import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';

class SignUp9 extends StatelessWidget {
  const SignUp9({super.key});

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
                      const CustomTextInformation(text: 'Allergy', color: kPrimaryColor),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      const CustomTextFormField(label: 'Allergy Name'),
                      const CustomTextFormField(
                        label: 'Allergean Name',
                      ),
                       Row(
                        children: [
                          Expanded(child: CustomTextFormField(label: 'Start Date',icon: IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month)),)),
                          const Expanded(
                            child:  CustomTextFormField(
                              label: 'Security Level',
                            ),
                          ),
                        ],
                      ),
                      const CustomTextFormField(label: 'Body Response',maxLines: 2),
                      const CustomTextFormField(label: 'Notes', maxLines: 3),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: kPrimaryColor,
                        onTap: () {
                          Navigator.pushNamed(context, '/signUp10');
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
