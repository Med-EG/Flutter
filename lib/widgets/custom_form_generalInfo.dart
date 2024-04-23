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
        child:  Column(
          children: [
          const  Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  label: 'Height',
                )),
                Expanded(child: CustomTextFormField(label: 'Weight'))
              ],
            ),
           const CustomTextFormField(label: 'BloodType'),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DropDownTextField1(hintText: 'Smoker',
                  enableSearch: false, data: ['yes','no'], onDataSelected: (String ) {  },),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: DropDownTextField1(hintText: 'Smoking Level',
                  enableSearch: false, data: ['light smoker','Moderate smoker','Heavy smoker'], onDataSelected: (String ) {  },),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: DropDownTextField1(hintText: 'Alcoholic',
                  enableSearch: false, data:['yes','no'], onDataSelected: (String ) {  },),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: DropDownTextField1(hintText: 'Alcoholic Level',
                  enableSearch: false, data:['light alcohlic','Moderate alcohlic','Heavy alcohlic'], onDataSelected: (String ) {  },),
                ))
              ],
            ),
           const CustomTextFormField(
              label: 'Job',
            ),
           const  CustomTextFormField(
              label: 'Marital Status',
            ),
            const CustomTextFormField(
              label: 'Past Fractures',
            ),
             Row(
              children: [
                const Expanded(
                    child:  CustomTextFormField(
              label: 'Sleeping Hours',
            ),),
                Expanded(
                    child: DropDownTextField1(hintText: 'Sleeping Quality',
                    enableSearch: false, data: ['bad','good','very good'], onDataSelected: (String ) {  },))
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
