import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';

class TopHalfBlueScreen extends StatelessWidget {
  const TopHalfBlueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.4,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 50))),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  top: screenHeight * .125,
                  left: screenWidth * .15,
                  child: Container(
                    height: screenHeight * 0.15,
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.black),
                    child: SvgPicture.asset('assets/images/SVG/google.svg'),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: -10,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                    )),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
