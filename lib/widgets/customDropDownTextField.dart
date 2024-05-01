import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class DropDownTextField1 extends StatefulWidget {
   DropDownTextField1(
      {super.key, required this.hintText, this.enableSearch = true,required this.data, required this.onDataSelected});
  final String hintText;
  final bool enableSearch;
  List<String>data;
  final Function(String) onDataSelected;

  @override
  State<DropDownTextField1> createState() => _DropDownTextField1State();
}

class _DropDownTextField1State extends State<DropDownTextField1> {
 
  // final List<DropDownValueModel> medicineNames = const [
  //   DropDownValueModel(name: 'aa', value: "aa"),
  //   DropDownValueModel(
  //     name: 'bb',
  //     value: "bb",
  //   ),
  //   DropDownValueModel(name: 'xx', value: "xx"),
  //   DropDownValueModel(name: 'ff', value: "ff"),
  //   DropDownValueModel(name: 'cc', value: "cc"),
  //   DropDownValueModel(name: 'ee', value: "ee"),
  //   DropDownValueModel(name: 'zz', value: "zz"),
  // ];
  dynamic selcetedMedicine = '';

  final dummyData = TextEditingController();

  @override
  String selectedData='';
  Widget build(BuildContext context) {
      List<String>data1=widget.data;
      List<DropDownValueModel>datax=[];
for (int i = 0; i < data1.length; i++)
{
 datax.add(DropDownValueModel(name: data1[i], value: data1[i]  ));
}
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(0.4))),
      child: DropDownTextField(
        searchDecoration: const InputDecoration(fillColor: Colors.black),
        enableSearch: widget.enableSearch,
        textFieldDecoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            fillColor: Colors.white,
            enabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        dropDownList: datax,
        onChanged: (value) {
          setState(() {
            selcetedMedicine = value;
          });
          widget.onDataSelected(selectedData);
        },
      ),
    );
  }
}
