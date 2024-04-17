import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Views/signUp3.dart';
import '../constants/colors.dart';
import '../cubits/RegisterCubit/sign_up_cubit.dart';
import 'custom_profile_container.dart';
import 'custom_textFormField.dart';

// ignore: must_be_immutable
class TestForm extends StatelessWidget {
  String id = 'TestForm';

  bool _obscureText = true;

  bool _obscureText1 = true;

  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isLoading = false;
  DateTime? birthDate;
  int? phoneNumber;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterpasswordController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addrressController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  TestForm({super.key});

  @override
  Widget build(BuildContext context) {
    var nationalID = ModalRoute.of(context)!.settings.arguments;
    double screenHeight = MediaQuery.of(context).size.height;
    String password = passwordController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String userName = userNameController.text;
    String gender = genderController.text;
    String email = emailController.text;
    String address = addrressController.text;

    return BlocConsumer<SignUpCubit, SignUpCubitState>(
      listener: (context, state) {
        if (state is SignUpCubitLoading) {
          isLoading = true;
        } else if (state is SignUpCubitSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, const SignUp3().id,
              arguments: firstName);
        } else if (state is ShowPassword) {
          _obscureText = !_obscureText;
          isLoading = false;
        } else if (state is PasswordValidation && !state.isValid) {
          'The password must be at least 8 characters';
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const CustomProfileContainer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'First name is required';
                                    }
                                    return null;
                                  },
                                  controller: firstNameController,
                                )),
                                Expanded(
                                    child: CustomTextFormField(
                                  label: 'Last Name',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Last name is required';
                                    }
                                    return null;
                                  },
                                  controller: lastNameController,
                                ))
                              ],
                            ),
                            CustomTextFormField(
                              label: 'E-mail',
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "E-mail is required";
                                } else if (!value.contains('@')) {
                                  return "Wrong format";
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required";
                                  }
                                  return null;
                                },
                                obscureText: _obscureText,
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
                                      icon: Icon(_obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.remove_red_eye_outlined)),
                                  label: Text(
                                    'Enter password',
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8)),
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "This Field is required";
                                  }
                                  return null;
                                },
                                obscureText: _obscureText1,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                  fillColor: offWhite,
                                  filled: true,
                                  focusColor: kPrimaryColor,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        _obscureText1 = !_obscureText1;
                                      },
                                      icon: Icon(_obscureText1
                                          ? Icons.visibility_off_outlined
                                          : Icons.remove_red_eye_outlined)),
                                  label: Text(
                                    'Re-enter password',
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8)),
                                  ),
                                  border: buildBorder(),
                                  labelStyle: const TextStyle(color: lightGrey),
                                  enabledBorder: buildBorder(grey),
                                  focusedBorder: buildBorder(kPrimaryColor),
                                ),
                              ),
                            ),
                            /* Row(
                              children: [
                                const Expanded(
                                    child: DropDownTextField1(
                                  hintText: 'Gender',
                                  enableSearch: false,
                                )),
                                Expanded(
                                    child: CustomTextFormField(
                                  onChanged: (value) {
                                    birthDate = value;
                                  },
                                  readOnly: true,
                                  label: 'Date of birth',
                                  hint: dateTime.toString(),
                                  icon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.calendar_month)),
                                ))
                              ],
                            ),*/
                            CustomTextFormField(
                              label: 'Phone number',
                              textinputType:
                                  const TextInputType.numberWithOptions(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Phone Number is required";
                                }
                                return null;
                              },
                            ),
                            Row(
                              children: [
                                const Expanded(
                                    child: CustomTextFormField(
                                  label: 'Emergency Contact',
                                  textinputType:
                                      TextInputType.numberWithOptions(),
                                )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add))
                              ],
                            ),
                            CustomTextFormField(
                              label: 'Address',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Address is required";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormField(
                              label: 'Gender',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Gender is required";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormField(
                              label: 'username',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username is required";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormField(
                              label: 'birth date',
                              controller: dateController,
                              isDateField: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Date is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            GestureDetector(
                              onTap: () async {
                                var signUp =
                                    BlocProvider.of<SignUpCubit>(context);
                                if (formkey.currentState!.validate()) {
                                  signUp.signUp(body: {
                                    'first_name': firstName,
                                    'last_name': lastName,
                                    'username': userName,
                                    'password': password,
                                    'gender': gender,
                                    'national_id': nationalID,
                                    'email': email,
                                    'address': address,
                                    'birth_date': birthDate,
                                    'phone_number': phoneNumber,
                                  }, url: 'https://api-medeg.online/api/medEG/patient/signup');
                                }
                              },
                              child: Container(
                                height: 57,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: kPrimaryColor),
                                child: const Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
