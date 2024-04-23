import 'package:flutter/material.dart';
import 'package:med_eg/widgets/time_card.dart';

class DaysView extends StatelessWidget {
  const DaysView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.12,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 16),
            itemCount: 7,
        itemBuilder: (context, index) {
          return TimeCard(
            width: screenWidth * 0.12,
            borderRadius: 16,
          );
        },
      ),
    );
  }
}
