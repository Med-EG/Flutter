import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewRecordContainer extends StatelessWidget {
  const NewRecordContainer({
    super.key, required this.text, required this.image, this.onTap,
  });
final String text;
final String image;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
   
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: screenWidth * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff98b3e1),
          ),
          child:Column(children: [
             SvgPicture.asset(image),
              Text(text,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
          ],),
        
        ),
      ),
    );
  }
}
