import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'custom_textFormField.dart';

class CustomFormWidget extends StatefulWidget {
  const CustomFormWidget({super.key});

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  bool _obscureText = true;
  bool _obscureText1 = true;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  label: 'First Name',
                )),
                Expanded(child: CustomTextFormField(label: 'Last Name'))
              ],
            ),
            const CustomTextFormField(label: 'E-mail'),
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
                    child: CustomTextFormField(
                  label: 'Gender',
                )),
                Expanded(
                    child: CustomTextFormField(
                  label: 'Date of birth',
                  icon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.calendar_month)),
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
