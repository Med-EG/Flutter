// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:med_eg/Views/medical_record_copy.dart';
import 'package:med_eg/services/Medicine%20Info.dart';
import '../constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';
class SignUp8 extends StatelessWidget {
  const SignUp8({super.key});
  final String id = 'SignUp8';
  @override
  Widget build(BuildContext context) {
    final int medicalId = ModalRoute.of(context)!.settings.arguments as int;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController medicineNameController = TextEditingController();
    TextEditingController doseController = TextEditingController();
    TextEditingController frequencyController = TextEditingController();
    TextEditingController notesController = TextEditingController();

    Future <void> addMedicine() async {
      try {
        await MedicineInfoForRecordService().addService(
          context: context,
          medicineName: medicineNameController.text,
          dose: doseController.text,
          frequency: frequencyController.text,
          medicalRecordId: medicalId,
          notes: notesController.text.isNotEmpty ? notesController.text : null,
          doctorId: null,
        );
         // ignore: use_build_context_synchronously
         Navigator.pushNamed(context, const MedicalRecordCopy().id);
      } catch (e) {
         print('Error adding medicine: $e');
      }
    }

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
                        onTap: () async{
                          await addMedicine();
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
