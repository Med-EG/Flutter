import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Views/signUp3.dart';
import '../constants/colors.dart';
import '../cubits/RegisterCubit/sign_up_cubit.dart';
import 'custom_textFormField.dart';

// ignore: must_be_immutable
class CustomFormWidget extends StatelessWidget {
  late TextEditingController dateController;
  late TextEditingController firstNameController;
  bool obscureText = true;
  bool obscureText1 = true;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  DateTime dateTime = DateTime.now();
  String? password;
  String? personalImage;
  String? firstName;
  String? lastName;
  String? userName;
  String? gender;
  String? email;
  String? address;
  String? birthDate;
  String? phoneNumber;
  bool isLoading = false;

  CustomFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var nationalId = ModalRoute.of(context)!.settings.arguments;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocConsumer<SignUpCubit, SignUpCubitState>(
      listener: (context, state) {
        if (state is SignUpCubitLoading) {
          isLoading = true;
        } else if (state is SignUpCubitSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, const SignUp3().id,
              arguments: firstName);
        } else if (state is ShowPassword) {
          obscureText = !obscureText;
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Form(
              key: formkey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormField(
                        label: 'First Name',
                        
                        onChanged: (value) {
                          firstName = value;
                        },
                      )),
                      Expanded(
                          child: CustomTextFormField(
                        label: 'Last Name',
                        
                        onChanged: (value) {
                          lastName = value;
                        },
                      ))
                    ],
                  ),
                  CustomTextFormField(
                    label: 'E-mail',
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: obscureText,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        fillColor: offWhite,
                        filled: true,
                        focusColor: kPrimaryColor,
                        suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<SignUpCubit>(context)
                                  .passwordVisiblity();
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined)),
                        label: Text(
                          'Enter password',
                          style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                        ),
                        border: buildBorder(),
                        labelStyle: const TextStyle(color: lightGrey),
                        enabledBorder: buildBorder(grey),
                        focusedBorder: buildBorder(kPrimaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: obscureText1,
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        fillColor: offWhite,
                        filled: true,
                        focusColor: kPrimaryColor,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(obscureText1
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined)),
                        label: Text(
                          'Re-enter password',
                          style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                        ),
                        border: buildBorder(),
                        labelStyle: const TextStyle(color: lightGrey),
                        enabledBorder: buildBorder(grey),
                        focusedBorder: buildBorder(kPrimaryColor),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormField(
                        onChanged: (value) {
                          dateTime = value as DateTime;
                        },
                        readOnly: true,
                        label: 'Date of birth',
                        hint: dateTime.toString(),
                        icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.calendar_month)),
                      ))
                    ],
                  ),
                  CustomTextFormField(
                    label: 'Phone number',
                    textinputType: const TextInputType.numberWithOptions(),
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Address',
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Gender',
                    onChanged: (value) {
                      gender = value;
                    },
                  ),
                  CustomTextFormField(
                    label: 'username',
                    onChanged: (value) {
                      userName = value;
                    },
                  ),
                  CustomTextFormField(
                    label: 'personalImage',
                    onChanged: (value) {
                      personalImage = value;
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      var signUp = BlocProvider.of<SignUpCubit>(context);
                      if (formkey.currentState!.validate()) {
                        signUp.signUp(body: {
                          'first_name': firstName,
                          'last_name': lastName,
                          'username': userName,
                          'password': password,
                          'gender': gender,
                          'national_id': nationalId,
                          'email': email,
                          'address': address,
                          'birth_date': birthDate,
                          'phone_number': phoneNumber,
                          'personal_image': personalImage
                        }, url: 'https://api-medeg.online/api/medEG/patient/signup');
                      }

                      /*  final passwordController = TextEditingController();
                      String? password = passwordController.text;
                      await Api().post(
                          url: 'https://api-medeg.online/api/medEG/patient/signup',
                          body: {
                            'first_name': firstName,
                            'last_name': lastName,
                            'username': userName,
                            'password': password,
                            'gender': gender,
                            'birth_date': birthDate,
                            'phone_number': phoneNumber,
                            'address': address,
                            'national_id': nationalID
                          });*/
                    },
                    child: Container(
                      height: 57,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
