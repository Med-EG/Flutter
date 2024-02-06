import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/customWidgets/custom_textFormField.dart';

import '../constants/colors.dart';

class SignUp2 extends StatelessWidget {
  const SignUp2({super.key});

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
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: screenWidth * 0.25,
                  ),
                  SvgPicture.asset('assets/images/Frame.svg')
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    color: Color(0xffE7E7E7),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/Image.png',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 100,
                        right: 0,
                        child: Container(
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue, // Color of the circle
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signUp3');
                },
                child: Container(
                  height: 51,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(blue)),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
