import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton(
      {super.key,
      this.height = 40,
      this.width = 40,
      this.size = 40,
      required this.borderRadius,
      required this.plusIcon,
      this.onTap});
  final double borderRadius;
  final bool plusIcon;
  final double size;
  final double height;
  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 8),
              )
            ],
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Icon(
          plusIcon ? Icons.add : Icons.remove,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
