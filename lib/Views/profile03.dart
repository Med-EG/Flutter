import 'package:flutter/material.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import '../widgets/custom_textFormField.dart';

class Profile03 extends StatefulWidget {
  const Profile03({super.key});
  final String id = 'Profile03';
  @override
  State<Profile03> createState() => _Profile03State();
}

class _Profile03State extends State<Profile03> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late final int height;
  late final int weight;
  late final String bloodType;
  late final bool alcoholic;
  late final String alcoholicLevel;
  late final bool smoker;
  late final String smokerLevel;
  late final String job;
  late final String maritalStatus;
  String? pastFracues;
  String? sleepingHours;
  String? sleepingQuality;
  late final String father;
  late final String mother;
  String? secondDegree;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FutureBuilder<List<MedicalRecordModel>>(
                builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Form(
                  key: formkey,
                  autovalidateMode: autovalidateMode,
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            label: 'Height',
                          )),
                          Expanded(child: CustomTextFormField(label: 'Weight'))
                        ],
                      ),
                      CustomTextFormField(label: 'BloodType'),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: CustomTextFormField(
                              label: 'Smoker',
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: CustomTextFormField(
                              label: 'Smoking Level',
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: CustomTextFormField(
                              label: 'Alcoholic',
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: CustomTextFormField(
                              label: 'Alcoholic Level',
                            ),
                          ))
                        ],
                      ),
                      CustomTextFormField(
                        label: 'Job',
                      ),
                      CustomTextFormField(
                        label: 'Marital Status',
                      ),
                      CustomTextFormField(
                        label: 'Past Fractures',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              label: 'Sleeping Hours',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              label: 'Sleeping Quality',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }else{
                return const CircularProgressIndicator();
              }
            })),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
