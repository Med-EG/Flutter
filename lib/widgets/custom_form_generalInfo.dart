import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'customDropDownTextField.dart';
import 'custom_textFormField.dart';

class CustomFormGeneralInfo extends StatefulWidget {
  const CustomFormGeneralInfo({super.key});

  @override
  State<CustomFormGeneralInfo> createState() => _CustomFormGeneralInfoState();
}

class _CustomFormGeneralInfoState extends State<CustomFormGeneralInfo> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final int height;
  late final int weight;
  late final String bloodType;
  late final bool alcoholic;
  late final String alcoholicLevel;
  late final bool smoker;
  late final String smokerLevel;
  late final String job;
  late final String maritalStatus;
  late final String pastFracues;
  String? sleepingHours;
  String? sleepingQuality;
  late final String father;
  late final String mother;
  String? secondDegree;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  label: 'Height',
                )),
                Expanded(child: CustomTextFormField(label: 'Weight'))
              ],
            ),
            const CustomTextFormField(label: 'BloodType'),
            const Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DropDownTextField1(
                    hintText: 'Smoker',
                    enableSearch: false,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: DropDownTextField1(
                    hintText: 'Smoking Level',
                    enableSearch: false,
                  ),
                ))
              ],
            ),
            const Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DropDownTextField1(
                    hintText: 'Alcoholic',
                    enableSearch: false,
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: DropDownTextField1(
                    hintText: 'Alcoholic Level',
                    enableSearch: false,
                  ),
                ))
              ],
            ),
            const CustomTextFormField(
              label: 'Job',
            ),
            const CustomTextFormField(
              label: 'Marital Status',
            ),
            const CustomTextFormField(
              label: 'Past Fractures',
            ),
            Row(
              children: [
                const Expanded(
                  child: CustomTextFormField(
                    label: 'Sleeping Hours',
                  ),
                ),
                Expanded(
                    child: dropdownlistItem('Alcoholic level', const [
                  DropDownValueModel(name: 'Low', value: 'Low'),
                  DropDownValueModel(name: 'Moderate', value: 'Moderate'),
                  DropDownValueModel(name: 'High', value: 'High'),
                ]))
              ],
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }

  dropdownlistItem(String hintText, List<DropDownValueModel> options) {
    String selectedItem;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: DropDownTextField(
        searchDecoration: const InputDecoration(fillColor: Colors.black),
        textFieldDecoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            fillColor: Colors.white,
            enabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        dropDownList: options,
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
    );
  }
}
