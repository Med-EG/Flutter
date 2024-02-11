import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/widgets/custom_form.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_profile_container.dart';

class SignUp2 extends StatelessWidget {
  const SignUp2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomArrowBack(),
                  SizedBox(
                    width: screenWidth * 0.25,
                  ),
                  SvgPicture.asset('assets/images/Frame.svg')
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const CustomProfileContainer(),
                    const CustomFormWidget(),
                  ],
                )),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomButton(
                text: 'Next',
                color: Colors.blue,
                onTap: () {
                  Navigator.pushNamed(context, '/signUp3');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
