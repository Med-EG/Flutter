import 'package:flutter/material.dart';
import 'custom_textFormField.dart';

class CustomFormWidget extends StatefulWidget {
  const CustomFormWidget({super.key});

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
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
            CustomTextFormField(
                label: 'Enter Password',
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
            CustomTextFormField(
                label: 'Re-enter Password',
                obscureText: true,
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
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
}
