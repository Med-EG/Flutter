import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key,required this.text, this.onTap, required this.image});
  final String text;
   final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
   double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: const Color(0xFFf1f3f5).withOpacity(0.4),
                    offset: const Offset(5, 5),
                    blurRadius: 10),
              ]),
              height: screenHeight * 0.05,
              
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                style:const TextStyle(color: Color(0xFFc9cdda),
                fontSize: 8
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
