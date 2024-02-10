import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_eg/constants/texts.dart';
import 'package:med_eg/widgets/custom_textFormField.dart';
import 'package:med_eg/widgets/signUP_with.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  bool agree = false;
 TextEditingController nationalIDController = TextEditingController();
  String _message = '';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Spacer(
                      flex: 3,
                    ),
                    SvgPicture.asset('assets/images/Frame.svg'),
                    const Spacer(
                      flex: 4,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight / 50,
              ),
              const Text('Register',
                  style: TextStyle(
                      color: darkBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 28)),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                height: screenHeight * 0.06,
                child:
                    const CustomTextFormField(hint: 'Natinal Id', maxLines: 1),
              ),
              SizedBox(
                height: screenHeight * 0.001,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: darkBlue,
                      value: agree,
                      onChanged: (val) {
                        setState(() {
                          agree = val!;
                        });
                      },
                    ),
                    const Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: 'I agree with ',
                          style: TextStyle(
                              fontSize: 13,
                              color: darkBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: 'Terms ',
                          style: TextStyle(
                              fontSize: 13,
                              color: blue,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: blue,
                              decorationThickness: 2),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                              fontSize: 13,
                              color: darkBlue,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              fontSize: 13,
                              color: blue,
                              decoration: TextDecoration.underline,
                              decorationColor: blue,
                              fontWeight: FontWeight.w500,
                              decorationThickness: 2),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () {
                  if (nationalIDController.text.length == 14 &&
                      agree == true) {
                    Navigator.pushNamed(context, '/signUp2');
                  } else if (nationalIDController.text.isEmpty ||
                      agree == false) {
                    setState(() {
                      _message = "Fill the Fields";
                    });
                  } else {
                    setState(() {
                      _message = "National ID must be 14 characters";
                    });
                  }
                },
                child: const CustomButton(
                  text: 'Register',
                  color: blue,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'You already have an account ? ',
                    style: TextStyle(
                        fontSize: 13,
                        color: darkBlue,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                        fontSize: 13, color: blue, fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Text(
                _message,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      height: 1,
                      color: lightGrey,
                    ),
                    const Text(
                      ' Or ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: lightGrey),
                    ),
                    Container(
                      width: screenWidth * 0.2,
                      height: 1,
                      color: lightGrey,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              const SignUpWith(
                image: 'assets/images/facebook.svg',
                text: signFacebook,
              ),
              SizedBox(
                height: screenHeight / 50,
              ),
              const SignUpWith(
                image: 'assets/images/google.svg',
                text: signGoogle,
              ),
              SizedBox(
                height: screenHeight / 50,
              ),
              const SignUpWith(
                image: 'assets/images/dribbble.svg',
                text: signEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
