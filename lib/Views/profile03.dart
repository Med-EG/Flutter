import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/custom_textFormField.dart';

// ignore: must_be_immutable
class Profile03 extends StatefulWidget {
   const Profile03({super.key});
  final String id = 'Profile03';
  @override
  State<Profile03> createState() => _Profile03State();
}

class _Profile03State extends State<Profile03> {
  final GlobalKey<FormState> formkey = GlobalKey();
 
  String? bloodTypee,
      alcoholicLevell,
      smokerLevell,
      jobb,
      maritalStatuss,
      pastFracuess,
      sleepingHourss,
      sleepingQualityy,
      fatherr,
      motherr,
      secondDegreee;
  int? heightt, weightt;
  bool? alcoholicc, smokerr;
   bool isLoading = false;
  /*late final int height;
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
  String? secondDegree;*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "General medical information",
                        style: TextStyle(
                            fontSize: 32,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            onChanged: (data) {
                              heightt = int.parse(data);
                            },
                            label: 'Height',
                          )),
                          Expanded(
                              child: CustomTextFormField(
                                  onChanged: (data) {
                                    weightt = int.parse(data);
                                  },
                                  label: 'Weight'))
                        ],
                      ),
                      CustomTextFormField(
                          onChanged: (data) {
                            bloodTypee = data;
                          },
                          label: 'BloodType'),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomTextFormField(
                              onChanged: (data) {
                                smokerr = bool.parse(data);
                              },
                              label: 'Smoker',
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomTextFormField(
                              onChanged: (data) {
                                smokerLevell = data;
                              },
                              label: 'Smoking Level',
                            ),
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomTextFormField(
                              onChanged: (data) {
                                alcoholicc = bool.parse(data);
                              },
                              label: 'Alcoholic',
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomTextFormField(
                              onChanged: (data) {
                                alcoholicLevell = data;
                              },
                              label: 'Alcoholic Level',
                            ),
                          ))
                        ],
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          jobb = data;
                        },
                        label: 'Job',
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          maritalStatuss = data;
                        },
                        label: 'Marital Status',
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          pastFracuess = data;
                        },
                        label: 'Past Fractures',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              onChanged: (data) {
                                sleepingHourss = data;
                              },
                              label: 'Sleeping Hours',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              onChanged: (data) {
                                sleepingQualityy = data;
                              },
                              label: 'Sleeping Quality',
                            ),
                          )
                        ],
                      ),
                      CustomButton(
                          onTap: () {
                            isLoading = true;
                            setState(() {
                              
                            });
                           try{
                           /*  EditMedicalRecord().editMedicalInfo(context,
                                height: heightt == null? medicalrecord.height: heightt!,
                                weight: weightt== null? medicalrecord.weight: heightt!,
                                blood_type: bloodTypee!,
                                alcoholic: alcoholicc!,
                                alcoholic_level: alcoholicLevell!,
                                smoker: smokerr!,
                                smoking_level: smokerLevell!,
                                job: jobb!,
                                marital_status: maritalStatuss!,
                                father: fatherr!,
                                mother: motherr!);
                                print('Success');*/
                           }catch(e)
                           {
                            print(e.toString());
                           }
                           isLoading = false;
                           setState(() {
                             
                           });
                          },
                          text: 'Save Changes')
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
