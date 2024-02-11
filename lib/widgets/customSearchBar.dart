import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
          'Search for doctor, articles...',
          style: TextStyle(fontSize: 15, color: Colors.grey.withOpacity(0.4)),
        ),
      ),
    );
  }
}
