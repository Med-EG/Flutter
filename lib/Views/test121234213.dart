import 'package:flutter/material.dart';
import 'package:med_eg/helper/API.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(onPressed: () {
          Api().post(
              url: 'https://api-medeg.online/api/medEG/check-availability',token: '1087|ilFsmgymCWAKrPa8Avf9iZQBY4gNWrpLdLC5F4pA9f517377',
              body: {"doctor_id": '25', "appointment_date": "2024-05-13"});
        }),
      ),
    );
  }
}
