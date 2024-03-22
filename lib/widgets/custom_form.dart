import 'package:flutter/material.dart';
import 'package:med_eg/widgets/customDropDownTextField.dart';
import '../Views/signUp3.dart';
import '../constants/colors.dart';
import 'custom_textFormField.dart';

class CustomFormWidget extends StatefulWidget {
  const CustomFormWidget({super.key});

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
   late TextEditingController dateController;
  bool _obscureText = true;
  bool _obscureText1 = true;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime(2025)).then((value) {
          setState(() {
            _dateTime = value!;
          });
        });
  }

  void submitForm() {
    final form = formkey.currentState;
    if (form!.validate()) {
      Navigator.pushNamed(
          context,
          const SignUp3(
            firstName: '',
          ).id);
      // Form is validated, you can perform actions like submitting the form data.
      // Example: submitting data to the server, etc.
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                )),
                Expanded(
                    child: CustomTextFormField(
                  label: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                ))
              ],
            ),
            CustomTextFormField(
              label: 'E-mail',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'E-mail is required';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: _obscureText,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  fillColor: offWhite,
                  filled: true,
                  focusColor: kPrimaryColor,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
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
                obscureText: _obscureText1,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  fillColor: offWhite,
                  filled: true,
                  focusColor: kPrimaryColor,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText1 = !_obscureText1;
                        });
                      },
                      icon: Icon(_obscureText1
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
                const Expanded(
                    child: DropDownTextField1(
                  hintText: 'Gender',
                  enableSearch: false,
                )),
                Expanded(
                    child: CustomTextFormField(
                  readOnly: true,
                  label: 'Date of birth',
                  hint: _dateTime.toString(),
                  icon: IconButton(
                      onPressed: () {
                        _showDatePicker();
                      }, icon: const Icon(Icons.calendar_month)),
                ))
              ],
            ),
            const CustomTextFormField(
              label: 'Phone number',
              textinputType: TextInputType.numberWithOptions(),
            ),
            Row(
              children: [
                const Expanded(
                    child: CustomTextFormField(
                  label: 'Emergency Contact',
                  textinputType: TextInputType.numberWithOptions(),
                )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
            const Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  label: 'Country',
                )),
                Expanded(child: CustomTextFormField(label: 'City'))
              ],
            ),
            const CustomTextFormField(label: 'Street'),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            GestureDetector(
              onTap: () {
                submitForm();
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
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
