import 'package:flutter/material.dart';
import 'package:med_eg/models/allergyInfoModel.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants/colors.dart';
import '../models/medicalRecordModel.dart';
import '../services/allergy Service.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';

class UpdateAllergyScreen extends StatefulWidget {
  const UpdateAllergyScreen({super.key});
  final String id = 'UpdateAllergyScreen';
  @override
  State<UpdateAllergyScreen> createState() => _UpdateAllergyScreenState();
}

class _UpdateAllergyScreenState extends State<UpdateAllergyScreen> {
  String? allergyNamee, allergyTypee;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final AllergyInfoModel allergy =
        ModalRoute.of(context)!.settings.arguments as AllergyInfoModel;
    final MedicalRecordModel medicalId = ModalRoute.of(context)!.settings.arguments as MedicalRecordModel;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
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
                            text: 'Allergy', color: kPrimaryColor),
                        const CustomTextInformation(
                            text: 'Information', color: darkBlue),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        CustomTextFormField(
                          label: 'Allergy Name',
                          onChanged: (data) {
                            allergyNamee = data;
                          },
                        ),
                        CustomTextFormField(
                          label: 'Allergy Type',
                          onChanged: (data) {
                            allergyTypee = data;
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextFormField(
                              label: 'Start Date',
                              icon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.calendar_month)),
                            )),
                            const Expanded(
                              child: CustomTextFormField(
                                label: 'Security Level',
                              ),
                            ),
                          ],
                        ),
                        const CustomTextFormField(
                            label: 'Body Response', maxLines: 2),
                        const CustomTextFormField(label: 'Notes', maxLines: 3),
                        SizedBox(
                          height: screenHeight * 0.04,
                        ),
                        CustomButton(
                          text: 'Save',
                          color: kPrimaryColor,
                          onTap: () {
                            isLoading = true;
                            setState(() {});
                            try {
                              /* updateAllergyMethod(context, allergy, medicalId); */
                               ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Updated Successfully'),
                            ),
                          );
                            } catch (e) {}
                            isLoading = false;
                            setState(() {});
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
      ),
    );
  }

  /* void updateAllergyMethod(
      BuildContext context, AllergyInfoModel allergy, MedicalRecordModel medicalId) {
    AllergyInfoForRecordService().updateAllergyInfoService(context,
        allergy: allergy.allergyId,
        allergyName: allergyNamee== null ? allergy.allergyName : allergyNamee!,
        allergyType: allergyTypee == null ? allergy.allergyType : allergyTypee!,
        medicalRecordId: medicalId);
  }
} */
}