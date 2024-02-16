import 'package:flutter/material.dart';
import 'package:med_eg/widgets/custom_button.dart';
import '../constants/colors.dart';
import '../widgets/new_record_container.dart';

class SignUp6 extends StatelessWidget {
  const SignUp6({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            const Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: 'Click to ',
                  style: TextStyle(
                      fontSize: 24,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'add',
                  style: TextStyle(
                    fontSize: 24,
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            const Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: 'new ',
                  style: TextStyle(
                      fontSize: 24,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Record',
                  style: TextStyle(
                    fontSize: 24,
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              children: [
                Expanded(
                  child: NewRecordContainer(
                    text: 'Disease',
                    image: 'assets/images/SVG/Virus.svg',
                    onTap: () => Navigator.pushNamed(context, '/signUp7'),
                  ),
                ),
                Expanded(
                  child: NewRecordContainer(
                    text: 'Medicine',
                    image: 'assets/images/SVG/Capsule & Pill.svg',
                    onTap: () => Navigator.pushNamed(context, '/signUp8'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: NewRecordContainer(
                    text: 'Allergy',
                    image: 'assets/images/SVG/Capsule & Pill.svg',
                    onTap: () => Navigator.pushNamed(context, '/signUp9'),
                  ),
                ),
                Expanded(
                  child: NewRecordContainer(
                    text: 'Operation',
                    image: 'assets/images/SVG/Heart Rate.svg',
                    onTap: () => Navigator.pushNamed(context, '/signUp10'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.12,
              child: NewRecordContainer(
                text: 'Relatives',
                image: 'assets/images/SVG/3 User.svg',
                onTap: () => Navigator.pushNamed(context, '/signUp11'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Done',
                color: kPrimaryColor,
                onTap: () {
                  Navigator.pushNamed(context, '/signUp12');
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
