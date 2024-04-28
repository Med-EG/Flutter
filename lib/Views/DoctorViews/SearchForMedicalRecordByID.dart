  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:med_eg/Views/medical_record.dart';
  import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
  import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
  import 'package:med_eg/cubits/MedicineAlert/medicine_alert_cubit.dart';
  import 'package:med_eg/helper/API.dart';
  import 'package:med_eg/models/doctorModel.dart';
  import 'package:med_eg/models/medicalRecordModel.dart';
  import 'package:med_eg/widgets/customSearchBar.dart';
  import 'package:med_eg/widgets/custom_arrow_back.dart';
  import 'package:med_eg/widgets/custom_button.dart';
  import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

  // ignore: must_be_immutable
  class SearchForMedicalRecordByID extends StatelessWidget {
    SearchForMedicalRecordByID({super.key});
    final String id = 'SearchForMedicalRecordByID';
    bool isLoading = false;
    String patientID='';
      int ?patientIDD;
    MedicalRecordModel? _medicalRecordModel;
    final _textController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
      return BlocConsumer<MedicalRecordCubit, MedicalRecordState>(
          listener: (context, state) {
        if (state is Loading) {
          isLoading = true;
        }
        if (state is MedicalRecordSuccessState) {
          Navigator.pushReplacementNamed(context,const MedicalRecord().id);
        }
        if (state is MedicalRecordFailureState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text('check the ID please'),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Image.asset('assets/images/PNG/Frame.png')),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset(
                          'assets/images/PNG/AppLogo.png',
                          height: 50,
                        ),
                        const Row(
                          children: [
                            CustomArrowBack(),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                       const Spacer(flex: 1,),
                        Searchbar(
                          labelText: 'Search for record by medical record ID', controller: _textController, isItForPatientIDSearch: true,
                        ),
                       const Spacer(flex: 1,),
                        CustomButton(
                          text: 'Search',
                          onTap: () async {
                              patientID = _textController.text;
                              patientIDD = int.tryParse(patientID);
                              print(patientIDD);
                            
                            

                            if (patientID.isNotEmpty) {
                                BlocProvider.of<MedicalRecordCubit>(context).patientIDGetByDoctorSearch=patientIDD!;
                              final response = await Api().get(
                                url:
                                    'https://api-medeg.online/api/medEG/record/$patientID',
                                token: doctor!.token,
                              );

                              if (response != null) {
                                MedicalRecordModel _medicalRecordModel =
                                    MedicalRecordModel.fromJson(response);
                                // ignore: use_build_context_synchronously
                                BlocProvider.of<MedicalRecordCubit>(context)
                                    .success(_medicalRecordModel,);
                              } else {
                                // ignore: use_build_context_synchronously
                                BlocProvider.of<MedicalRecordCubit>(context)
                                    .failure('try again');
                              }
                            } 
                            else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        'Please enter a valid patient ID.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                       const Spacer(flex: 2)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    }
  }
