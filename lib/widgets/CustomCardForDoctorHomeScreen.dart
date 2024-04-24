
import 'package:flutter/material.dart';

class CustomCardForDoctorHomeScreen extends StatelessWidget {
  const CustomCardForDoctorHomeScreen({
    super.key, required this.text, required this.icon, required this.ontap,
  });
final String text;
final Icon icon;
final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 125,
        height: 200,
        decoration:  BoxDecoration(
          border: Border.all(color: Color(0xff407CE2),width: 8),
         color: Colors.transparent ,
          borderRadius: BorderRadius.all(Radius.circular(18)) 
        ),
        child:Column(
          children: [
            Icon(icon.icon,color:Color(0xff407CE2),size: 90,),
            Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(text,style: TextStyle(color: Color(0xff407CE2),fontWeight: FontWeight.bold,fontSize: 15),),
            )
          ],
        ) ,),
    );
  }
}
