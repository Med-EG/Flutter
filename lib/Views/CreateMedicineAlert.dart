// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/PatientAlertsScreen.dart';
import 'package:med_eg/Views/test2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'package:med_eg/widgets/TimePicker.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

class CreateMedicineAlert extends StatefulWidget {
  const CreateMedicineAlert({Key? key}) : super(key: key);
  final String id = 'CreateMedicineAlert';

  @override
  State<CreateMedicineAlert> createState() => _CreateMedicineAlertState();
}

List<Widget> widgets = [];
int counter = 0;
List<String> times = [];
String selectedTimee = '';

class _CreateMedicineAlertState extends State<CreateMedicineAlert> {
  late String selectedMedicine;
  late String enteredData;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    selectedMedicine = '';
    enteredData = '';
  }

  @override
  Widget build(BuildContext context) {
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient;
    return BlocConsumer<MedicineAlertCubit, MedicineAlertState>(
      listener: (context, state) {
        if(state is ShowAllMedicineAlerts)
        {
          Navigator.pushReplacementNamed(context,PatientAlertsScreen().id);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const Positioned(
                right: -80,
                top: -80,
                child: CustomCircleContainer(),
              ),
              const Positioned(
                left: -180,
                bottom: -180,
                child: CustomCircleContainer(),
              ),
              Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.max, // Set the mainAxisSize to min
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  CustomArrowBack(),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  SizedBox(height: 50),
                                ],
                              ), // Adjusted spacing
                              const Text(
                                'Creating alert',
                                style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 100),
                              SearchBarForMedicines(
                                onMedicineSelected: (medicine) {
                                  setState(() {
                                    selectedMedicine = medicine;
                                  });
                                },
                              ),
                              const SizedBox(height: 40), 
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter data';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  //hintText: "Dose",
                                  labelText: "dose",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: kPrimaryColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: kPrimaryColor),
                                  ),
                                ),
                                onChanged: (value) {
                                  enteredData = value;
                                },
                              ),
                              const SizedBox(height: 20), // Adjusted spacing
                              TimePicker(
                                onTimeSelected: (selectedTime) {
                                  setState(() {
                                    selectedTimee = selectedTime;

                                    times.add(selectedTime);
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 30),
                              //   child: CustomButton(
                              //     text: 'add another time',
                              //     onTap: () {
                              //       showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) {
                              //           return AlertDialog(
                              //             title: Text('Select Time'),
                              //             content: TimePicker(
                              //               onTimeSelected: (selectedTime) {
                              //                 setState(() {
                              //                   selectedTimee = selectedTime;
                              //                   times.add(selectedTime);
                              //                 });
                              //               },
                              //             ),
                              //             actions: <Widget>[
                              //               TextButton(
                              //                 onPressed: () {
                              //                   Navigator.of(context).pop();
                              //                 },
                              //                 child: Text('Cancel'),
                              //               ),
                              //               TextButton(
                              //                 onPressed: () {
                              //                   // You can handle adding the selected time here
                              //                   Navigator.of(context).pop();
                              //                 },
                              //                 child: Text('OK'),
                              //               ),
                              //             ],
                              //           );
                              //         },
                              //       );
                              //     },
                              //     color: const Color.fromARGB(255, 45, 111, 79),
                              //   ),
                              // ),

                              const SizedBox(height: 60), // Adjusted spacing
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: CustomButton(
                                  text: 'Add Alert',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      var createMedicineAlert1 =
                                          BlocProvider.of<MedicineAlertCubit>(
                                              context);
                                      createMedicineAlert1
                                          .CreateNewMedicineALert(
                                        patientToken: patient!.token,
                                        body: {
                                          'patient_id': patient.id,
                                          'medicine_name': selectedMedicine,
                                          'medicine_dose': enteredData,
                                        },
                                        url:
                                            'https://api-medeg.online/api/medEG/medicine-alert',
                                        times: times,
                                      );
                                     
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(height: 20), // Adjusted spacing
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
