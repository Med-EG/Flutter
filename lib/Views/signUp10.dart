import 'package:flutter/material.dart';
import 'package:med_eg/Views/signUp6.dart';
import '../constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';


class SignUp10 extends StatelessWidget {
  const SignUp10({super.key});
final String id = '';
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
                          text: 'Operation', color: kPrimaryColor),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      const CustomTextFormField(label: 'Operation Name'),
                      const CustomTextFormField(
                        label: 'Surgeon Name',
                      ),
                      CustomTextFormField(
                        label: 'Operation Date',
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_month)),
                      ),
                      const CustomTextFormField(
                          label: 'Complications', maxLines: 2),
                      const CustomTextFormField(label: 'Notes', maxLines: 3),
                      SizedBox(
                        height: screenHeight * 0.04,
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
