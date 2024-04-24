import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDetailsInfoRow extends StatelessWidget {
  const CustomDetailsInfoRow({
    super.key,
    this.text = 'None', this.onPressed, this.onPressed2, this.onPressed3,
  });
  final String text;
  final void Function()? onPressed;
   final void Function()? onPressed2;
    final void Function()? onPressed3;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, bottom: 8),
          child: Text(
            text,
            style:  TextStyle(
                fontSize: screenWidth *0.033, fontWeight: FontWeight.w600, 
                color: text == 'None' ? grey : darkBlue),
          ),
        ),
        if (text != 'None')
        Row(
          children: [
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.document_scanner_rounded,
                  color: kPrimaryColor,
                )),
            IconButton(
                onPressed: onPressed2,
                icon: const Icon(
                  Icons.edit_document,
                  color: kPrimaryColor,
                )),
            IconButton(
                onPressed: onPressed3,
                icon: const Icon(
                  Icons.delete_rounded,
                  color: kPrimaryColor,
                )),
          ],
        )
      ],
    );
  }
}
