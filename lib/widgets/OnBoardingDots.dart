import 'package:flutter/material.dart';

class OnBordingDots extends StatelessWidget{
   const OnBordingDots({super.key, required this.dotColor});

    final Color dotColor;
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(border: Border.all(color: Colors.black),shape: BoxShape.circle,color:dotColor ),
      
    );
  }
}