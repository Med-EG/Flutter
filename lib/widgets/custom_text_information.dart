import 'package:flutter/material.dart';

class CustomTextInformation extends StatelessWidget {
  const CustomTextInformation({super.key, required this.text, required this.color});
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style:  TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: color),
    );
  }
}
