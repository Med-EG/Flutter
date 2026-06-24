import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

// ignore: must_be_immutable
class HalfTextFieldHalfDropDown extends StatefulWidget {
  final bool isItDoseTextField;
   final Function(String) onDataEntered;

  final List<DropDownValueModel> timeList = const [
    DropDownValueModel(name: 'AM', value: "AM"),
    DropDownValueModel(
      name: 'PM',
      value: "PM",
    )
  ];
  final List<DropDownValueModel> doseList = const [
    DropDownValueModel(name: 'ml', value: "ml"),
    DropDownValueModel(
      name: 'mg',
      value: "mg",
    ),
  ];
  HalfTextFieldHalfDropDown({
    super.key,
    required this.isItDoseTextField, required this.onDataEntered,
  });
  int selectedValue = 0;
 
  @override
  State<HalfTextFieldHalfDropDown> createState() =>
      _HalfTextFieldHalfDropDownState();
}

class _HalfTextFieldHalfDropDownState extends State<HalfTextFieldHalfDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
              widget.onDataEntered(value); // Pass the entered data to the callback function
            },
              //keyboardType: TextInputType.number,
              //trying to make the textfield only take numbers from 1 to 12 for the time textfield
              // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^1[012]$'))],
              decoration: InputDecoration(
                labelText: widget.isItDoseTextField ? 'Dose' : 'Time',
                fillColor: Colors.white,
                hintStyle: const TextStyle(color: lightGrey),
                enabledBorder: buildBorder(grey),
                focusedBorder: buildBorder(grey),
                
              ),
            ),
          ),
          Container(
            width: 100,
            height: 64,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black.withOpacity(0.4)),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: DropDownTextField(
              initialValue: widget.isItDoseTextField ? 'ml' : 'Am',
              textFieldDecoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  enabledBorder: InputBorder.none,
                  hintText: widget.isItDoseTextField ? 'ml' : 'Am'),
              clearOption: false,
              dropdownColor: Colors.white,
              dropDownList:
                  widget.isItDoseTextField ? widget.doseList : widget.timeList,
              onChanged: (value) {
                setState(() {
                  widget.selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
