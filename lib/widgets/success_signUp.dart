import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key, required this.color, required this.image});
final int color;
final String image;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth = MediaQuery.of(context).size.width;
    return  Container(
                height: screenHeight * 0.4,
                width: screenWidth * 0.5,
                decoration:  BoxDecoration(
                    color: Color(color), shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SvgPicture.asset(image),
                ),
              );
  }
}