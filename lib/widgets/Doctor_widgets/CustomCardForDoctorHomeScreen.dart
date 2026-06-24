
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class CustomCardForDoctorHomeScreen extends StatelessWidget {
  const CustomCardForDoctorHomeScreen({
    super.key, required this.text, required this.icon, required this.ontap, required this.height, required this.width,

  });
final String text;
final IconData icon;
final void Function() ontap;
final double height,width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration:  BoxDecoration(
          border: Border.all(color: kPrimaryColor,width: 8),
         color: Colors.white ,
          borderRadius: BorderRadius.all(Radius.circular(25)) 
        ),
        child:Column(
          children: [
            Icon(icon,color:kPrimaryColor,size: 90,),
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(text,style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 15),),
            )
          ],
        ) ,),
    );
  }
}
