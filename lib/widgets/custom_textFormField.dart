import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:intl/intl.dart';

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
      this.onFieldSubmitted,
      this.errorText,
      this.maxLength,
      this.isDateField = false});
  final int? maxLength;
  final bool readOnly;
  final TextEditingController? controller;
  final String label;
  final String? errorText;
  final String? hint;
  final int maxLines;
  final void Function(String)? onChanged;
  final TextInputType? textinputType;
  final IconButton? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool isDateField;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        maxLength: maxLength,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly || isDateField,
        controller: controller,
        keyboardType: textinputType,
        onChanged: onChanged,
        cursorColor: grey,
        maxLines: maxLines,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
            border: buildBorder(),
            errorText: errorText,
            fillColor: offWhite,
            filled: true,
            hintText: hint,
            labelText: label,
            labelStyle: const TextStyle(color: lightGrey),
            enabledBorder: buildBorder(grey),
            focusedBorder: buildBorder(kPrimaryColor),
            suffixIcon: isDateField ? buildDateSuffixIcon(context) : icon),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }

  Widget buildDateSuffixIcon(BuildContext context) {
    return IconButton(
        onPressed: () {
          _selectDate(context);
        },
        icon: const Icon(Icons.calendar_today));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null && controller != null) {
      final formattedDate = DateFormat('yyy-MM-dd').format(picked);
      controller!.text = formattedDate;
    }
  }
}
