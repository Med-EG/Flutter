import 'package:flutter/material.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_profile_container.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants/colors.dart';
import '../../models/doctorModel without token.dart';
import '../../services/doctor services/edit doctor info .dart';
import '../../widgets/custom_textFormField.dart';

// ignore: must_be_immutable
class EditBasicInfoForDoctor extends StatefulWidget {
  const EditBasicInfoForDoctor({super.key});
  final String id = 'EditBasicInfoForDoctor';
  @override
  State<EditBasicInfoForDoctor> createState() => _EditBasicInfoForDoctorState();
}

class _EditBasicInfoForDoctorState extends State<EditBasicInfoForDoctor> {
  final GlobalKey<FormState> formkey = GlobalKey();
  String? drfirstNamee;
  String? drLastNamee;
  String? emaill;
  int? passwordd;
  String? genderr;
  String? specializationn;
  String? educationn;
  int? licenceIdd;
  String? countryy;
  String? cityy;
  String? streett;
  String? scientificDegreee;
  int? pricee;
  bool obscureText = true;
  bool isLoading = false;
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
                      const CustomProfileContainer(),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            onChanged: (data) {
                              drfirstNamee = data;
                            },
                            label: 'First Name',
                          )),
                          Expanded(
                              child: CustomTextFormField(
                                  onChanged: (data) {
                                    drLastNamee = data;
                                  },
                                  label: 'Last Name'))
                        ],
                      ),
                      CustomTextFormField(
                          onChanged: (data) {
                            emaill = data;
                          },
                          label: 'E-mail'),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        onChanged: (data) {
                          passwordd = int.parse(data);
                        },
                        obscureText: obscureText,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          fillColor: offWhite,
                          filled: true,
                          focusColor: kPrimaryColor,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined)),
                          label: Text(
                            'password',
                            style:
                                TextStyle(color: Colors.grey.withOpacity(0.8)),
                          ),
                          border: buildBorder(),
                          labelStyle: const TextStyle(color: lightGrey),
                          enabledBorder: buildBorder(grey),
                          focusedBorder: buildBorder(kPrimaryColor),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomTextFormField(
                              onChanged: (data) {
                                genderr = data;
                              },
                              label: 'Gender',
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomTextFormField(
                              onChanged: (data) {},
                              label: 'Years of Exp.',
                            ),
                          ))
                        ],
                      ),
                      CustomTextFormField(
                        textinputType: const TextInputType.numberWithOptions(),
                        onChanged: (data) {
                          licenceIdd = int.parse(data);
                        },
                        label: 'Licence Id',
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          specializationn = data;
                        },
                        label: 'Specialization',
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          educationn = data;
                        },
                        label: 'Education',
                      ),
                      CustomTextFormField(
                        textinputType: const TextInputType.numberWithOptions(),
                        onChanged: (data) {
                          pricee = int.parse(data);
                        },
                        label: 'Price',
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          scientificDegreee = data;
                        },
                        label: 'Scientific Degree',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              onChanged: (data) {
                                countryy = data;
                              },
                              label: 'Country',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              onChanged: (data) {
                                cityy = data;
                              },
                              label: 'City',
                            ),
                          )
                        ],
                      ),
                      CustomTextFormField(
                        onChanged: (data) {
                          streett = data;
                        },
                        label: 'Street',
                      ),
                      CustomButton(
                          onTap: () {
                           /*  isLoading = true;
                            setState(() {});
                            try {
                              editDoctor(context);
                              print('success');
                            } catch (e) {
                              print(e.toString());
                            }

                            isLoading = false;
                            setState(() {}); */
                            /* try{
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
                           } */
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

 /*  void editDoctor(BuildContext context, DoctorModelWithoutToken doctor) {
    EditDoctorInfo().editDoctorBasicInfo(context,
        drfirstName: drfirstNamee == null? doctor.doctorFirstName: drfirstNamee!,
        drLastName: drLastNamee == null? doctor.doctorLastName: drLastNamee!,
        email:emaill == null? doctor.email: emaill!,
        password: passwordd == null? doctor.p!,
        gender: genderr!,
        specialization: specializationn!,
        education: educationn!,
        licenceId: licenceIdd!,
        country: countryy!,
        city: cityy!,
        street: streett!,
        scientificDegree: scientificDegreee!,
        price: pricee!);
  }
 */
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
