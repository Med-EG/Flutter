// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class Searchbar extends StatelessWidget {
   const Searchbar({
    Key? key,
    required this.labelText,
    required this.controller, 
    this.ontap, required this.isItForPatientIDSearch, // Make ontap optional
  }) : super(key: key);
  final String labelText;
  final void Function()? ontap;
  final TextEditingController controller;
  final bool isItForPatientIDSearch;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'this field is required';
        }
      },
      onTap: ontap,
     keyboardType: isItForPatientIDSearch
          ? TextInputType.number
          : TextInputType.text, // Adjusted syntax
      maxLength: isItForPatientIDSearch ? 15 : null, //
       controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.6))),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kPrimaryColor)),
        prefixIcon: const Icon(Icons.search),
        
        label: Text(
          labelText,
          style: TextStyle(fontSize: 15, color: Colors.grey.withOpacity(0.4)),
        ),
      ),
    );
  }
}
