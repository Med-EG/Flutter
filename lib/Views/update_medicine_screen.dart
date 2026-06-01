import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';
class UpdateMedicineScreen extends StatelessWidget {
  const UpdateMedicineScreen({super.key});
  final String id = 'UpdateMedicineScreen';
  @override
  Widget build(BuildContext context) {
    final int medicalId = ModalRoute.of(context)!.settings.arguments as int;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController medicineNameController = TextEditingController();
    TextEditingController doseController = TextEditingController();
    TextEditingController frequencyController = TextEditingController();
    TextEditingController notesController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned(
                right: -80, top: -80, child: CustomCircleContainer()),
            const Positioned(
                left: -180, bottom: -180, child: CustomCircleContainer()),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomArrowBack(),
                      const CustomTextInformation(
                          text: 'Medicine', color: kPrimaryColor),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.075,
                      ),
                      CustomTextFormField(label: 'Medicine Name',
                      controller: medicineNameController,
                      ),
                       CustomTextFormField(
                        label: 'Dose',
                        controller: doseController,
                      ),
                       CustomTextFormField(label: 'Frequency',
                       controller: frequencyController,
                       ),
                       CustomTextFormField(
                        label: 'Notes',
                        maxLines: 3,
                        controller: notesController,
                      ),
                      SizedBox(
                        height: screenHeight * 0.14,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: kPrimaryColor,
                        onTap: () {
                          
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
