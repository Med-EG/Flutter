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
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
          hintText: 'Enter city name',
          prefixIcon: const Icon(Icons.search),
          label: const Text('Search for doctor, article...'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(kPrimaryColor)),
          ),
        ),
      );
  }
}
