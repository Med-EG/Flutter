import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GeneralInfoRow extends StatelessWidget {
  const GeneralInfoRow({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Row(
        children: [
          Text(
            text1,
            style: const TextStyle(
                fontSize: 12, color: darkBlue, fontWeight: FontWeight.w600),
          ),
          Text(
            text2,
            style: const TextStyle(
                fontSize: 12,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
