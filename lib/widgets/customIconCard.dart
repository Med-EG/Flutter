import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
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
              height: screenHeight * 0.07,
              child: Image.asset(
                image,
                height: 50,
              ),
            ),
          ),
          Text(
            text,
            style:const TextStyle(color: Color(0xFFc9cdda)),
          )
        ],
      ),
    );
  }
}
