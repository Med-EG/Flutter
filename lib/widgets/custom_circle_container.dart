import 'package:flutter/material.dart';

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: 360,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xffe5ecfa)),
    );
  }
}
