import 'package:flutter/material.dart';
import 'package:med_eg/helper/API.dart';

class GetAllMedicineService{
  Future<List<String>> GetAllMedicines(BuildContext context) async {
    try {
  List<dynamic> data = await Api().get(url: 'https://api-medeg.online/api/medEG/medication',);
  
  List<String> medicines = [];
  for (int i = 0; i < data.length; i++) {
    medicines.add(data[i]);
  } 
  return medicines;
} catch (e) {
  print('Error fetching appointments: $e');
      // Handle the error here, e.g., return an empty list or show an error message.
     // List<AppointmentModel> data=[];
      return [];
}
  }
}