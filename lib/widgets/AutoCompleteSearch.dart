import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/services/get_all_doctors.dart';

class MySearchApp extends StatefulWidget {
  @override
  _MySearchAppState createState() => _MySearchAppState();
}

class _MySearchAppState extends State<MySearchApp> {
  final _textController = TextEditingController();
  final _doctorsMap = Map<int, String>();

  @override
  void initState() {
    super.initState();
    _fetchDoctorsList();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _fetchDoctorsList() async {
    final doctorsList = await GetAllDoctorService().GetAllDoctors(context);
    for (final doctor in doctorsList) {
      _doctorsMap[doctor.doctorID] = '${doctor.doctorFirstName} ${doctor.doctorLastName} (${doctor.specification})';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SimpleAutoCompleteTextField(
      controller: _textController,
      key: GlobalKey(),
      suggestions: _doctorsMap.values.toList(),
      textChanged: (text) {
        // Implement custom filtering logic here based on text
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
        ),
        focusColor: kPrimaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 18.0),
        hintText: "Search for a doctor",
      ),
      textSubmitted: (suggestion) {
        // Handle selection of suggestion
        final doctorID = _doctorsMap.entries.firstWhere(
          (entry) => entry.value == suggestion,
          orElse: () => MapEntry(0, ""),
        ).key;
        print('Selected suggestion: $suggestion');
        print('Corresponding doctor ID: $doctorID');
      },
    );
  }
}
