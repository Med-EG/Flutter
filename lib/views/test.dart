import 'package:flutter/material.dart';
import 'package:med_eg/widgets/custom_form.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomFormWidget(),
    );
  }
}