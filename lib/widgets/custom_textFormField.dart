import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.label,
      this.maxLines = 1,
      this.onChanged,
      this.textinputType,
      this.icon,
      this.obscureText = false});

  final String label;
  final int maxLines;
  final void Function(String)? onChanged;
  final TextInputType? textinputType;
  final IconButton? icon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: textinputType,
        onChanged: onChanged,
        cursorColor: grey,
        maxLines: maxLines,
        obscureText: obscureText,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            border: buildBorder(),
            fillColor: offWhite,
            filled: true,
            labelText: label,
            labelStyle: const TextStyle(color: lightGrey),
            enabledBorder: buildBorder(grey),
            focusedBorder: buildBorder(kPrimaryColor),
            suffixIcon: icon),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
