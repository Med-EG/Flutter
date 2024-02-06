import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.customButtonText, required this.routeName});
  String customButtonText;
  String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        child: Center(
            child: Text(
          customButtonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
        width: 310,
        height: 51,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(72),
            color: const Color(kPrimaryColor)),
      ),
    );
  }
}
