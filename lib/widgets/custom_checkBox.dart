import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),

                      activeColor: darkBlue,

                      value: agree,
                      onChanged: (val) {
                        setState(() {
                          agree = val!;
                        });
                      },
                    );
  }
}