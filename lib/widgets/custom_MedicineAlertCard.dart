import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';

// ignore: must_be_immutable
class MedicineAlertCard extends StatelessWidget {
  MedicineAlertCard({super.key, required this.alert});
  final MedicineAlertModel alert;
  List<String> times = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < alert.alertTimes.length; i++) {
      times.add(alert.alertTimes[i].alertTime.toString());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        //width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 169, 192, 233),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    alert.medicineName,
                    style: const TextStyle(
                        color: darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      alert.dose.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 55, 68, 162)),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  for (int i = 0; i < times.length; i++) Text(times[i]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
