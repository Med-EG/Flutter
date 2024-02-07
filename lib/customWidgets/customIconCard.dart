import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.image});
  final String image ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(5, 5),
                    blurRadius: 10)
              ]),
              child: Image.asset(image),
            )
          ],
        )
      ],
    );
  }
}
