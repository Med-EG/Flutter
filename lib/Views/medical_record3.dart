import 'package:flutter/material.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/services/Medicine%20Info.dart';
import '../constants/colors.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';

class MedicalRecord3 extends StatefulWidget {
  const MedicalRecord3({super.key});
  static String id = 'MedicalRecord3';
  @override
  State<MedicalRecord3> createState() => _MedicalRecord3State();
}

class _MedicalRecord3State extends State<MedicalRecord3> {
  String? medicineNamee, frequencyy, dosee, notess;
  late MedicalInfoModel medicine; // Declare medicine variable

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve medicine object from arguments map
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, MedicalInfoModel>;
    medicine = arguments['medicine']!;
    // Pre-fill form fields with medicine data
    medicineNamee = medicine.medicineName;
    dosee = medicine.dose;
    frequencyy = medicine.frequency;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
                      CustomTextFormField(
                        label: 'Medicine Name',
                        onChanged: (data) {
                          medicineNamee = data;
                        },
                      ),
                      CustomTextFormField(
                        label: 'Dose',
                        onChanged: (data) {
                          dosee = data;
                        },
                      ),
                      CustomTextFormField(
                        label: 'Frequency',
                        onChanged: (data) {
                          frequencyy = data;
                        },
                      ),
                      CustomTextFormField(
                        label: 'Notes',
                        maxLines: 3,
                        onChanged: (data) {
                          notess = data;
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.14,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: kPrimaryColor,
                        onTap: () async {
                          setState(() {});
                          try {
                            await updateMedicine();
                             Navigator.pop(context);
                          } catch (e) {
                            print(e.toString());
                          }
                          
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

  Future<void> updateMedicine() async {
    try {
      await MedicineInfoForRecordService().editMedicineInfoService(
          context, medicine,
          medicineName:
              medicineNamee == null ? medicine.medicineName : medicineNamee!,
          dose: dosee == null ? medicine.dose : dosee!,
          frequency: frequencyy == null ? medicine.frequency : frequencyy!);

      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }
}
