import 'package:flutter/material.dart';
import 'package:med_eg/Views/signUp6.dart';
import 'package:med_eg/widgets/success_signUp.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';

class SignUp3 extends StatelessWidget {
  const SignUp3({super.key,  this.firstName = ''});
final String id = 'SignUp3';
final String firstName;
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
              const SuccessSignUp(
                  color: 0xffD9D9D9, image: 'assets/images/SVG/Stroke 3.svg'),
               Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 22)),
                    TextSpan(
                        text: firstName,
                        style: const TextStyle(
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
              SizedBox(
                width: screenWidth * 0.5,
                child: CustomButton(
                  text: 'Next',
                  color: kPrimaryColor,
                  onTap: () {
                    Navigator.pushNamed(context, const SignUp6().id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
