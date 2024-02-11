import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpWith extends StatelessWidget {
  const SignUpWith({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        width: screenWidth * 0.9,
        height: 200,
        decoration: BoxDecoration(
            color: const Color(0xffE4E4E4),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:32),
          child: Row(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(image)),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(text,
                      style: const TextStyle(
                          color: Color(0xff283D66), fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
