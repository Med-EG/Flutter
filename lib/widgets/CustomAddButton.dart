import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton(
      {super.key,
      required this.borderRadius,
      required this.plusIcon,
      this.onTap});
  final double borderRadius;
  final bool plusIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
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
          size: 40,
        ),
      ),
    );
  }
}
