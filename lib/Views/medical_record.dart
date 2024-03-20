import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_button.dart';

import '../widgets/custom_details_info.dart';
import '../widgets/general_info_row.dart';

class MedicalRecord extends StatelessWidget {
  const MedicalRecord({super.key});
  final String id = 'MedicalRecord';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SvgPicture.asset(
                                'assets/images/SVG/Frame (1).svg'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Medical Record ID',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: darkBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Text(
                            '#123786',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                const Text(
                  'Mohamed ElSayed',
                  style: TextStyle(
                      fontSize: 18,
                      color: darkBlue,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '27 Years old',
                  style: TextStyle(
                      color: darkBlue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.04),
                const CustomTextRichInfo(
                  text1: 'General ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                const GeneralInfoRow(
                  text1: 'Weight : ',
                  text2: '80 KG',
                ),
                const GeneralInfoRow(
                  text1: 'Height : ',
                  text2: '180 CM',
                ),
                const GeneralInfoRow(
                  text1: 'Blood type : ',
                  text2: 'A+',
                ),
                const GeneralInfoRow(
                  text1: 'Alcoholic : ',
                  text2: 'Yes',
                ),
                const GeneralInfoRow(
                  text1: 'Alcoholic Level : ',
                  text2: 'Low',
                ),
                const GeneralInfoRow(
                  text1: 'Smoker : ',
                  text2: 'No',
                ),
                const GeneralInfoRow(
                  text1: 'Smoking Level : ',
                  text2: '-',
                ),
                const GeneralInfoRow(
                  text1: 'Job : ',
                  text2: 'Teacher',
                ),
                const GeneralInfoRow(
                  text1: 'Married : ',
                  text2: '4 H',
                ),
                const GeneralInfoRow(
                  text1: 'Sleeping Quality : ',
                  text2: 'Bad',
                ),
                const GeneralInfoRow(
                  text1: 'Past Fracures : ',
                  text2: 'Bad',
                ),
                const CustomTextRichInfo(
                  text1: 'Diseases ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                const CustomDetailsInfoRow(
                  text: '.Diabetes',
                ),
                const CustomDetailsInfoRow(
                  text: '.Alzheimer\'s Disease',
                ),
                const CustomDetailsInfoRow(
                  text: '.HIV/AIDS',
                ),
                const CustomTextRichInfo(
                  text1: 'Medication ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                const CustomDetailsInfoRow(
                  text: '.Aspirin',
                ),
                const CustomDetailsInfoRow(
                  text: '.Lisinopril 50Ml',
                ),
                const CustomDetailsInfoRow(
                  text: '.Metformin',
                ),
                const CustomTextRichInfo(
                  text1: 'Allergies ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                const CustomDetailsInfoRow(
                  text: '.Pollen Allergy (Hay Fever)',
                ),
                const CustomTextRichInfo(
                  text1: 'Operation ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                const CustomTextRichInfo(
                  text1: 'Family ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                const CustomDetailsInfoRow(
                  text: '.Father',
                ),
                const CustomDetailsInfoRow(
                  text: '.Mother',
                ),
                const CustomDetailsInfoRow(
                  text: '.Second Degree',
                ),
               const Padding(
                 padding: EdgeInsets.symmetric(vertical: 24),
                 child: CustomButton(text: 'Done'),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class CustomTextRichInfo extends StatelessWidget {
  const CustomTextRichInfo({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final String text1;
  final String text2;
  final String text3;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: text1,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: darkBlue)),
      TextSpan(
          text: text2,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: kPrimaryColor)),
      TextSpan(
          text: text3,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: darkBlue)),
    ]));
  }
}

