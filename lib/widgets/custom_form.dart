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
                  hint: 'First Name',
                )),
                Expanded(child: CustomTextFormField(hint: 'Last Name'))
              ],
            ),
            const CustomTextFormField(hint: 'E-mail'),
            CustomTextFormField(
                hint: 'Enter Password',
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
            CustomTextFormField(
                hint: 'Re-enter Password',
                icon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.remove_red_eye))),
            Row(
              children: [
                const Expanded(
                    child: CustomTextFormField(
                  hint: 'Gender',
                )),
                Expanded(
                    child: CustomTextFormField(
                  hint: 'Date of birth',
                  icon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.calendar_month)),
                ))
              ],
            ),
            const CustomTextFormField(
              hint: 'Phone number',
              textinputType: TextInputType.numberWithOptions(),
            ),
            Row(
              children: [
                const Expanded(
                    child: CustomTextFormField(
                  hint: 'Emergency Contact',
                  textinputType: TextInputType.numberWithOptions(),
                )),
                Expanded(
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.add)))
              ],
            ),
            const Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  hint: 'Country',
                )),
                Expanded(child: CustomTextFormField(hint: 'City'))
              ],
            ),
            const CustomTextFormField(hint: 'Street'),
          ],
        ),
      ),
    );
  }
}
