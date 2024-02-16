import 'package:flutter/material.dart';
import 'package:med_eg/widgets/CustomAddButton.dart';
import 'package:med_eg/widgets/customDropDownTextField.dart';
import 'package:med_eg/widgets/customHalfTextFieldHalfDropDown.dart';

class CreateMedicineAlert extends StatefulWidget {
  const CreateMedicineAlert({super.key});

  @override
  State<CreateMedicineAlert> createState() => _CreateMedicineAlertState();
}

List<Widget> widgets = [];
int counter = 0;

class _CreateMedicineAlertState extends State<CreateMedicineAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const DropDownTextField1(),
                const SizedBox(
                  height: 30,
                ),
                HalfTextFieldHalfDropDown(isItDoseTextField: true),
                HalfTextFieldHalfDropDown(isItDoseTextField: false),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    CustomAddButton(
                      borderRadius: 14,
                      plusIcon: true,
                      onTap: () {
                        setState(() {
                          widgets.insert(
                              counter,
                              Column(
                                children: [
                                  HalfTextFieldHalfDropDown(
                                      isItDoseTextField: false),
                                  Row(
                                    children: [
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      CustomAddButton(
                                        borderRadius: 14,
                                        plusIcon: false,
                                        onTap: () {
                                          setState(() {
                                            widgets.removeAt(counter);
                                            counter-1;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ));
                          counter + 1;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: widgets,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
