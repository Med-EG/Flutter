import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/Views/medical_record2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/diseaseInfoModel.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/services/GetBasicMedicalInfo.dart';
import 'package:med_eg/services/get%20Medicine%20info%20for%20a%20record.dart';
import 'package:med_eg/services/getDiseaseInfo.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/general_basic_medical_info.dart';
import '../widgets/custom_details_info.dart';
import '../widgets/name_age.dart';
import 'medical_record3.dart';

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
                          FutureBuilder<MedicalRecordModel>(
                            future: GetBasicMedicalInfo()
                                .getBasicMedicalInfo(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                MedicalRecordModel? medicalRecord =
                                    snapshot.data;
                                if (medicalRecord != null) {
                                  return Column(
                                    children: [
                                      Text(
                                        '#${medicalRecord.medicalId}',
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.03,
                                      ),
                                      const MyWidget(),
                                      SizedBox(height: screenHeight * 0.04),
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: CustomTextRichInfo(
                                          text1: 'General ',
                                          text2: 'Info. ',
                                          text3: ':',
                                        ),
                                      ),
                                      CustomGeneralBasicMedicalInfo(
                                          medicalRecord: medicalRecord)
                                    ],
                                  );
                                } else {
                                  return const Text(
                                      'Error: Medical record data is null');
                                }
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const CustomTextRichInfo(
                  text1: 'Diseases ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                FutureBuilder<List<DiseaseInfoModel>>(
                    future: GetDiseaseInfoForRecord().getDiseaseInfo(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<DiseaseInfoModel> diseaseList = snapshot.data!;
                        return Column(
                          children: [
                            for (int i = 0; i < diseaseList.length; i++)
                              CustomDetailsInfoRow(
                                text: diseaseList[i].diseaseName,
                                onPressed: () {},
                                onPressed2: () {},
                                onPressed3: () {},
                              )
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text('No medicine information available'),
                        );
                      }
                    })),
                const CustomTextRichInfo(
                  text1: 'Medication ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                FutureBuilder<List<MedicalInfoModel>>(
                    future: GetMedicineInfoForRecord().getMedicineInfo(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<MedicalInfoModel> medicineList = snapshot.data!;
                        return Column(
                          children: [
                            for (int i = 0; i < medicineList.length; i++)
                              CustomDetailsInfoRow(
                                text: medicineList[i].medicineName,
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    MedicalRecord2().id,
                                    arguments: {
                                      'medicineId': medicineList[i].medicineId
                                    }, // Pass unique identifier
                                  );
                                },
                                onPressed2: () {
                                  Navigator.pushNamed(
                                      context, const MedicalRecord3().id);
                                },
                                onPressed3: () {},
                              )
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text('No medicine information available'),
                        );
                      }
                    })),
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
                const CustomDetailsInfoRow(),
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
