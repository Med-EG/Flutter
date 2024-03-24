import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDetailsInfoRow extends StatelessWidget {
  const CustomDetailsInfoRow({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: darkBlue),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.document_scanner_rounded,
                  color: kPrimaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_document,
                  color: kPrimaryColor,
                )),
            IconButton(
                onPressed: () {},
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
