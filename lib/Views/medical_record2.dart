import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import '../widgets/custom_circle_container.dart';

class MedicalRecord2 extends StatelessWidget {
  const MedicalRecord2({super.key});

  final String id = 'MedicalRecord2';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container positioned at the top left corner
            const Positioned(
                right: -80, top: -80, child: CustomCircleContainer()),
            const Positioned(
                left: -180, bottom: -180, child: CustomCircleContainer()),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomArrowBack(),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      const Text(
                        'Medicine',
                        style: TextStyle(
                            fontSize: 30,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        'Information',
                        style: TextStyle(
                            fontSize: 30,
                            color: darkBlue,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: screenHeight * 0.2,
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Medicine Name: ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('Aspirin',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Dose: ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('2 tablets',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Frequency: ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('3 times',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            const Row(
                              children: [
                                Text(
                                  'Notes: ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('Should be taken before food',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            const Row(
                              children: [
                                Text(
                                  'Add by: ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: darkBlue,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('Patient',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
