import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/constants/colors.dart';
import '../widgets/custom_text_information.dart';

class SignUp12 extends StatelessWidget {
  const SignUp12({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.5,
              width: screenWidth * 0.5,
              decoration: const BoxDecoration(
                  color: Color(0xff98b3e1), shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SvgPicture.asset(
                  'assets/images/Stroke 3.svg',
                  color: Colors.white,
                ),
              ),
            ),
            const CustomTextInformation(text: 'Your medical Record', color: darkBlue),
            const CustomTextInformation(text: 'have been Created', color: darkBlue),
            const CustomTextInformation(text: 'Successfully', color: kPrimaryColor),
          ],
        ),
      ),
    );
  }
}
