import 'package:flutter/material.dart';
import 'package:med_eg/Views/medical_record_copy.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/services/DiseaseInfo%20Service.dart';
import '../models/diseaseInfoModel.dart';
import '../widgets/custom_arrow_back.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circle_container.dart';
import '../widgets/custom_textFormField.dart';
import '../widgets/custom_text_information.dart';

class SignUp7 extends StatelessWidget {
  SignUp7({super.key});
  final String id = 'SignUp7';
  final TextEditingController medicalIdController = TextEditingController();
  final TextEditingController diseaseNameController = TextEditingController();
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
                          text: 'Disease', color: kPrimaryColor),
                      const CustomTextInformation(
                          text: 'Information', color: darkBlue),
                      SizedBox(
                        height: screenHeight * 0.075,
                      ),
                      CustomTextFormField(
                        label: 'Medical Record Id',
                        controller: medicalIdController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        label: 'Disease Name',
                        controller: diseaseNameController,
                        validator: (data) {
                          if (data!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                      ),
                      const CustomTextFormField(
                        label: 'Disease Description',
                        maxLines: 5,
                      ),
                      const CustomTextFormField(
                        label: 'Notes',
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: screenHeight * 0.15,
                      ),
                      CustomButton(
                        text: 'Save',
                        color: kPrimaryColor,
                        onTap: () async {
                          // Validate text fields
                          if (medicalIdController.text.isEmpty ||
                              diseaseNameController.text.isEmpty) {
                            // Show error message or handle empty fields
                            return;
                          }

                          // Function to create medicine with retry logic
                          Future<DiseaseInfoModel>
                              createMedicineWithRetry() async {
                            // Initial delay before the first retry
                            const initialDelay = Duration(seconds: 1);
                            // Maximum number of retry attempts
                            const maxRetries = 5;
                            // Exponential backoff factor (time multiplier)
                            const backoffFactor = 2;

                            for (var attempt = 0;
                                attempt <= maxRetries;
                                attempt++) {
                              try {
                                // Call the createDisease() function

                                await DiseaseInfoForRecord().createDisease(
                                  context,
                                  medicalIdd:
                                      int.parse(medicalIdController.text),
                                  diseaseNamee: diseaseNameController.text,
                                );
                                // Return the result if successful

                                print('create disease succefully');
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamed(
                                    context,  MedicalRecordCopy().id);
                              } catch (e) {
                                // Handle error
                                if (e.toString().contains('status code 429')) {
                                  // If the exception message contains 'status code 429', it indicates a rate limit exceeded
                                  print(
                                      'Rate limit exceeded. Retrying after ${initialDelay * (backoffFactor ^ attempt)}.');
                                  // Wait before retrying with exponential backoff
                                  await Future.delayed(
                                      initialDelay * (backoffFactor ^ attempt));
                                } else {
                                  // For other errors, rethrow the exception
                                  rethrow;
                                }
                              }
                            }
                            // If all retry attempts fail, throw an error
                            throw Exception(
                                'Failed to create medicine after multiple retry attempts.');
                          }

                          try {
                            // Call the createMedicineWithRetry function

                            await createMedicineWithRetry();
                            // Handle successful response
                            // For example, show a success message or navigate to the next screen
                          } catch (e) {
                            // Handle error
                            print('Error creating medicine: $e');
                            // Show error message to the user if needed
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
}
