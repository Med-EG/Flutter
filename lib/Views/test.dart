import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/models/medicineModel.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'package:med_eg/services/get_all_medicines.dart';
import 'package:med_eg/widgets/CustomAddButton.dart';
import 'package:med_eg/widgets/customDropDownTextField.dart';
import 'package:med_eg/widgets/customHalfTextFieldHalfDropDown.dart';
import 'package:med_eg/widgets/custom_button.dart';

class Test extends StatefulWidget {
  const Test({super.key});
final id='Test';
  @override
  State<Test> createState() => _CreateMedicineAlertState();
}

List<Widget> widgets = [];
int counter = 0;
String selectedMedicine = '';

String enteredData = '';
List<String> times = [];

class _CreateMedicineAlertState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    return BlocConsumer<MedicineAlertCubit, MedicineAlertState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    FutureBuilder(
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>> snapshot) {
                        if (snapshot.hasData) {
                          List<String> medicines = snapshot.data!;
                          // List<String> medicineNames = medicines
                          //     .map((medicine) => medicine.medicineName)
                          //     .toList();

                          return DropDownTextField1(
                              hintText: 'Medicine name',
                              data: medicines,
                              onDataSelected: (data) {
                                selectedMedicine = data;
                                setState(() {
                                  
                                });
                              });
                        }
                        return CircularProgressIndicator();
                      },
                      future: GetAllMedicineService().GetAllMedicines(context),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    HalfTextFieldHalfDropDown(
                        isItDoseTextField: true,
                        onDataEntered: (data) {
                          enteredData = data; // Store the entered data
                        }),
                    HalfTextFieldHalfDropDown(
                      isItDoseTextField: false,
                      onDataEntered: (data) {
                        times.add(data);
                      },
                    ),
                    Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        CustomAddButton(
                          borderRadius: 14,
                          plusIcon: true,
                          onTap: () {
                            print(times.length);
                            setState(() {
                              widgets.insert(
                                  counter,
                                  Column(
                                    children: [
                                      HalfTextFieldHalfDropDown(
                                        isItDoseTextField: false,
                                        onDataEntered: (data) {
                                          times.add(data);
                                        },
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          CustomAddButton(
                                            borderRadius: 14,
                                            plusIcon: false,
                                            onTap: () {
                                              setState(() {
                                                widgets.removeAt(counter);
                                                times.removeLast();
                                                counter - 1;
                                              });
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ));
                              counter + 1;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: widgets,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomButton(
                        text: 'Add Alert',
                        onTap: () {
                          var createMedicineAlert =
                              BlocProvider.of<MedicineAlertCubit>(context);
                          createMedicineAlert.CreateNewMedicineALert(
                              patientToken: patient!.token,
                              body: {
                                'patient_id': patient.id,
                                'medicine_name': selectedMedicine.toString(),
                                'medicine_dose': enteredData.toString()
                              },
                              url:
                                  'https://api-medeg.online/api/medEG/medicine-alert', times: times);
                          // for (int i = 0; i < times.length; i++) {
                          //   createMedicineAlert.CreateNewMedicineALertTime(
                          //       patientToken: patient.token,
                          //       alertTime: times[i],
                          //       url:
                          //           'https://api-medeg.online/api/medEG/alert-times');
                          // }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
