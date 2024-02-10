import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/screens/CreateMedicineAlert.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key, required this.borderRadius, required this.plusIcon});
  final double borderRadius;
  final bool plusIcon ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'CreateMedicineAlert');
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 8),)],
            color: const Color(kPrimaryColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Icon(
          plusIcon ? Icons.add : Icons.minimize,
          color: Colors.white,size: 40,
        ),
      ),
    );
  }
}
