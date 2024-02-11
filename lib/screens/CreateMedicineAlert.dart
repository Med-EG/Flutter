import 'package:flutter/material.dart';
import 'package:med_eg/customWidgets/customDropDownTextField.dart';

class CreateMedicineAlert extends StatefulWidget {
  const CreateMedicineAlert({super.key});

  @override
  State<CreateMedicineAlert> createState() => _CreateMedicineAlertState();
}

class _CreateMedicineAlertState extends State<CreateMedicineAlert> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            DropDownTextField1(),
          ],
        ),
      ),
    );
  }
}
