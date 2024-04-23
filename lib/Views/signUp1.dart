import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_eg/widgets/testForm.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textFormField.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});
  final String id = 'SignUp1';

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  bool agree = false;
  TextEditingController nationalIDController = TextEditingController();
  String _errormessage = '';

    @override
  void dispose() {
    nationalIDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    SvgPicture.asset(
                      'assets/images/SVG/Frame (1).svg',
                      height: screenHeight * 0.09,
                    ),
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
              SizedBox(height: screenHeight * 0.06),
              SizedBox(
                height: screenHeight * 0.09,
                child: CustomTextFormField(
                  textinputType: const TextInputType.numberWithOptions(),
                  controller: nationalIDController,
                  maxLength: 14,
                  label: 'National Id',
                  errorText: _errormessage.isEmpty ? null : _errormessage,
                ),
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
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
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
                              color: kPrimaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: kPrimaryColor,
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
                  setState(() {
                    _errormessage =
                        validateNationalId(nationalIDController.text);
                  });
                  if (_errormessage.isEmpty && agree == true) {
                    Navigator.pushNamed(context, TestForm().id,
                        arguments: nationalIDController.text);
                  }
                },
                child: const CustomButton(
                  text: 'Register',
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
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
                        fontSize: 13,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validateNationalId(String value) {
    if (value.isEmpty) {
      return 'National ID is required';
    } else if (value.length != 14) {
      return 'National ID must be 14 digits';
    }
    return '';
  }
}
