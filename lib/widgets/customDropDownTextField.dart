import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class DropDownTextField1 extends StatefulWidget {
  const DropDownTextField1({super.key});

  @override
  State<DropDownTextField1> createState() => _DropDownTextField1State();
}

class _DropDownTextField1State extends State<DropDownTextField1> {
  final List<DropDownValueModel> medicineNames = const [
    DropDownValueModel(name: 'aa', value: "aa"),
    DropDownValueModel(
      name: 'bb',
      value: "bb",
    ),
    DropDownValueModel(name: 'xx', value: "xx"),
    DropDownValueModel(name: 'ff', value: "ff"),
    DropDownValueModel(name: 'cc', value: "cc"),
    DropDownValueModel(name: 'ee', value: "ee"),
    DropDownValueModel(name: 'zz', value: "zz"),
  ];
  dynamic selcetedMedicine = '';

  final dummyData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: DropDownTextField(
        searchDecoration: const InputDecoration(fillColor: Colors.black),
        enableSearch: true,
        textFieldDecoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Medicine Name',
            fillColor: Colors.white,
            enabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        dropDownList: medicineNames,
        onChanged: (value) {
          setState(() {
            selcetedMedicine = value;
           // print(selcetedMedicine);
          });
        },
      ),
    );
  }
}
