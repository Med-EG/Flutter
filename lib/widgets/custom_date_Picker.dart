import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class DatePicker extends StatefulWidget {
  const DatePicker(
      {super.key, required this.intialeDate, required this.onDateSelected});

  final String intialeDate;
  final Function(String) onDateSelected;
  @override
  State<DatePicker> createState() => _DatePIckerState();
}

class _DatePIckerState extends State<DatePicker> {
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        _showDatePicker();
      },
      controller: _dateController,
      decoration: const InputDecoration(
        label: Text('date'),
        prefixIcon: Icon(Icons.calendar_today),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(13))),
      ),
      readOnly: true,
    );
  }

  Future<void> _showDatePicker() async {
    DateTime? _datePicked = await showDatePicker(
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2026),
        initialDate: DateTime.parse(widget.intialeDate));

    if (_datePicked != null) {
      setState(() {
        _dateController.text = _datePicked.toString().split(" ")[0];
        widget.onDateSelected(_dateController.text);
      });
    } else {
      setState(() {
        _dateController.text = widget.intialeDate;
      });
    }
  }
}
