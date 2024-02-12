import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: screenHeight * 0.2,
        width: screenWidth * 0.2,
        decoration: const BoxDecoration(
          color: Color(0xffE7E7E7),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/PNG/Image.png',
              ),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              right: 0,
              child: Container(
                height: screenHeight * 0.05,
                width: screenWidth * 0.05,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor, // Color of the circle
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }
}
