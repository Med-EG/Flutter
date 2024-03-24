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
      this.obscureText = false,
      this.validator,
      this.controller,
      this.readOnly = false,
      this.hint, 
      this.onFieldSubmitted});

  final bool readOnly;
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final int maxLines;
  final void Function(String)? onChanged;
  final TextInputType? textinputType;
  final IconButton? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
        controller: controller,
        keyboardType: textinputType,
        onChanged: onChanged,
        cursorColor: grey,
        maxLines: maxLines,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
            border: buildBorder(),
            fillColor: offWhite,
            filled: true,
            hintText: hint,
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
