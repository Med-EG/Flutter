import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/customWidgets/customButton.dart';
import 'package:med_eg/screens/loginScreen.dart';

class LetsGetStarted extends StatelessWidget {
  LetsGetStarted({super.key});
  String id = 'LetsGetStarted';
  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          children: [
            SizedBox(
              height: screenHieght * 0.06,
            ),
            Container(
                height: screenHieght * 0.30,
                child: SvgPicture.asset('assets/SVG/Frame.svg')),
            SizedBox(
              height: screenHieght * 0.01,
            ),
            const Text(
              'Lets\'s Get Started',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(kTextColor),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHieght * 0.015,
            ),
            const Text(
              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu',
              style: TextStyle(fontSize: 20, color: Color(kTextColor)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHieght * 0.08,
            ),
            CustomButton(customButtonText: 'Log in', routeName: Login().id),
            SizedBox(
              height: screenHieght * 0.02,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Login().id);
              },
              child: Container(
                child: Center(
                    child: Text(
                  'Sign up',
                  style: TextStyle(color: Color(kPrimaryColor), fontSize: 20),
                )),
                width: 310,
                height: 51,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(kPrimaryColor)),
                    borderRadius: BorderRadius.circular(72),
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
