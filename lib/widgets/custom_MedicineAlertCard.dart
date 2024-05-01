import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';
import 'package:med_eg/models/paitentModel.dart';

// ignore: must_be_immutable
class MedicineAlertCard extends StatelessWidget {
  MedicineAlertCard({super.key, required this.alert});
  final MedicineAlertModel alert;
  List<String> times = [];
  @override
  Widget build(BuildContext context) {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    for (int i = 0; i < alert.alertTimes.length; i++) {
      // Splitting the time string to extract hours and minutes
      List<String> timeParts = alert.alertTimes[i].alertTime.split(':');

      // Formatting the time as HH:MM
      String formattedTime = '${timeParts[0]}:${timeParts[1]}';

      // Adding the formatted time to the times list
      times.add(formattedTime);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        //width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 120, 184, 234),
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
                      " dose : ${alert.dose.toString()}",
                      style:
                          const TextStyle(color: Color.fromARGB(255, 5, 9, 36)),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  for (int i = 0; i < times.length; i++) Text("${times[i]}      "),
                  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content:
                                  Text("Are you sure you want to delete this"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Yes"),
                                  onPressed: () {
                                    BlocProvider.of<MedicineAlertCubit>(context)
                                        .DeleteMedicineAlert(
                                            patientToken: patient!.token,
                                            medicineID:
                                                alert.alertID.toString());
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
