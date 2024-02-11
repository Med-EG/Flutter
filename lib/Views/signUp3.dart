import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../widgets/custom_button.dart';

class SignUp3 extends StatelessWidget {
  const SignUp3({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.5,
                decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9), shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: SvgPicture.asset('assets/images/Stroke 3.svg'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22)),
                    TextSpan(
                        text: 'Shady',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            fontSize: 22))
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Text(
                'Your account has been created',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xffB4BAC9)),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              const Text(
                'Let start with your medical record',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff9DA3B1)),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              CustomButton(
                text: 'Next',
                color: kPrimaryColor,
                onTap: () {
                  Navigator.pushNamed(context, '/signUp7');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}