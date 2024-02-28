import 'package:flutter/material.dart';
import 'package:med_eg/widgets/time_card.dart';

class TimeView extends StatelessWidget {
  const TimeView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TimeCard(width: screenWidth * 0.25, borderRadius: 24),
          );
        },
      ),
    );
  }
}