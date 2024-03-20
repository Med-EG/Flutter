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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: const Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  label: 'Height',
                )),
                Expanded(child: CustomTextFormField(label: 'Weight'))
              ],
            ),
            CustomTextFormField(label: 'BloodType'),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DropDownTextField1(),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: DropDownTextField1(),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DropDownTextField1(),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: DropDownTextField1(),
                ))
              ],
            ),
            CustomTextFormField(
              label: 'Job',
            ),
             CustomTextFormField(
              label: 'Marital Status',
            ),
             CustomTextFormField(
              label: 'Past Fractures',
            ),
             Row(
              children: [
                Expanded(
                    child:  CustomTextFormField(
              label: 'Sleeping Hours',
            ),),
                Expanded(
                    child: DropDownTextField1())
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
}
