import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/Views/medical_record2%20for%20allergy.dart';
import 'package:med_eg/Views/medical_record2%20for%20disease.dart';
import 'package:med_eg/Views/medical_record2%20for%20operation.dart';
import 'package:med_eg/Views/medical_record2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/allergyInfoModel.dart';
import 'package:med_eg/models/diseaseInfoModel.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/operationInfoModel.dart';
import 'package:med_eg/services/allergy%20Service.dart';
import 'package:med_eg/services/Medicine%20Info.dart';
import 'package:med_eg/services/getDiseaseInfo.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/general_basic_medical_info.dart';
import '../models/patientInfo without token.dart';
import '../services/GetBasicMedicalInfo.dart';
import '../services/GetPatientbyID.dart';
import '../services/operation Service.dart';
import '../widgets/custom_details_info.dart';
import 'medical_record3.dart';
class MedicalRecord extends StatelessWidget {
  const MedicalRecord({Key? key}) : super(key: key);
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
                                      FutureBuilder<PatientInfoWithoutToken>(
                                        future: GetPatientByID()
                                            .getPatientByID(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else if (snapshot.hasData) {
                                            PatientInfoWithoutToken? patientInfo =
                                                snapshot.data;
                                            if (patientInfo != null) {
                                              return Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      '${patientInfo.firstName.toString()} ${patientInfo.lastName.toString()}',
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          color: darkBlue,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      '22 Years old',
                                                      style: TextStyle(
                                                          color: darkBlue,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return const Text(
                                                  'Error: Medical record data is null');
                                            }
                                          } else {
                                            return const CircularProgressIndicator();
                                          }
                                        },
                                      ),
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
                  future: DiseaseInfoForRecord().getDiseaseInfo(context),
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
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2ForDisease().id,
                                  arguments: {
                                    'diseaseId': diseaseList[i].diseaseId
                                  }, // Pass unique identifier
                                );
                              },
                              onPressed2: () {},
                              onPressed3: () {},
                            )
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('None'),
                      );
                    }
                  }),
                ),
                const CustomTextRichInfo(
                  text1: 'Medication ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                FutureBuilder<List<MedicalInfoModel>>(
                  future: MedicineInfoForRecordService()
                      .getMedicineInfoService(context),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<MedicalInfoModel> medicineList = snapshot.data!;
                      if (medicineList.isEmpty) {
                        return const CustomDetailsInfoRow();
                      }
                      return Column(
                        children: [
                          for (int i = 0; i < medicineList.length; i++)
                            CustomDetailsInfoRow(
                              text: medicineList[i].medicineName,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2().id,
                                  arguments: {
                                    'medicineId': medicineList[i].medicineId
                                  }, // Pass unique identifier
                                );
                              },
                              onPressed2: () {
                                Navigator.pushNamed(context, MedicalRecord3.id,
                                    arguments: {'medicineId': medicineList[i]});
                              },
                              onPressed3: () {
                                MedicineInfoForRecordService()
                                    .deleteMedicineInfo(
                                  context: context,
                                  medicalInfoModel: medicineList[i],
                                );
                              },
                            )
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('No medicine information available'),
                      );
                    }
                  }),
                ),
                const CustomTextRichInfo(
                  text1: 'Allergies ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                FutureBuilder<List<AllergyInfoModel>>(
                  future: AllergyInfoForRecordService()
                      .getAllergyInfoService(context),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<AllergyInfoModel> allergyList = snapshot.data!;
                      if (allergyList.isEmpty) {
                        return const CustomDetailsInfoRow();
                      }
                      return Column(
                        children: [
                          for (int i = 0; i < allergyList.length; i++)
                            CustomDetailsInfoRow(
                              text: allergyList[i].allergyName,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2ForAllergy().id,
                                  arguments: {
                                    'allergyId': allergyList[i].allergyId
                                  }, // Pass unique identifier
                                );
                              },
                              onPressed2: () {},
                              onPressed3: () {
                                AllergyInfoForRecordService().deleteAllergyInfo(
                                    context: context,
                                    allergyInfoModel: allergyList[i]);
                              },
                            )
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('None'),
                      );
                    }
                  }),
                ),
                const CustomTextRichInfo(
                  text1: 'Operation ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                FutureBuilder<List<OperationInfoModel>>(
                  future: OperationInfoForRecordService()
                      .getOperationInfoService(context),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      List<OperationInfoModel> operationList = snapshot.data!;
                      if (operationList.isEmpty) {
                        return const CustomDetailsInfoRow();
                      }
                      return Column(
                        children: [
                          for (int i = 0; i < operationList.length; i++)
                            CustomDetailsInfoRow(
                              text: operationList[i].operationName,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2ForOperation().id,
                                  arguments: {
                                    'operationId': operationList[i].operationId
                                  }, // Pass unique identifier
                                );
                              },
                              onPressed2: () {},
                              onPressed3: () {
                                OperationInfoForRecordService()
                                    .deleteOperationInfo(
                                        context: context,
                                        operationInfoModel: operationList[i]);
                              },
                            )
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text('None'),
                      );
                    }
                  }),
                ),
                const CustomTextRichInfo(
                  text1: 'Family ',
                  text2: 'Info. ',
                  text3: ':',
                ),
                 CustomDetailsInfoRow(
                  text: 'Father',
                  onPressed: (){

                  },
                ),
                const CustomDetailsInfoRow(
                  text: 'Mother',
                ),
                const CustomDetailsInfoRow(
                  text: 'Second Degree',
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
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

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
