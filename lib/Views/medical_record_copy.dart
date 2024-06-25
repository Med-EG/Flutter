import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/Views/medical_record2%20for%20allergy.dart';
import 'package:med_eg/Views/medical_record2%20for%20father.dart';
import 'package:med_eg/Views/medical_record2%20for%20mother.dart';
import 'package:med_eg/Views/medical_record2%20for%20operation.dart';
import 'package:med_eg/Views/medical_record2%20for%20second%20degree.dart';
import 'package:med_eg/Views/medical_record2.dart';
import 'package:med_eg/Views/signUp10.dart';
import 'package:med_eg/Views/signUp11.dart';
import 'package:med_eg/Views/signUp7.dart';
import 'package:med_eg/Views/signUp8.dart';
import 'package:med_eg/Views/signUp9.dart';
import 'package:med_eg/Views/update_allergy_screen.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/allergyInfoModel.dart';
import 'package:med_eg/models/diseaseInfoModel.dart';
import 'package:med_eg/models/medicalInfo.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/models/operationInfoModel.dart';
import 'package:med_eg/services/allergy%20Service.dart';
import 'package:med_eg/services/Medicine%20Info.dart';
import 'package:med_eg/services/DiseaseInfo%20Service.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/general_basic_medical_info.dart';
import '../services/GetBasicMedicalInfo.dart';
import '../services/operation Service.dart';
import '../widgets/CustomAddButton.dart';
import '../widgets/custom_details_info.dart';
import 'medical_record2 for disease.dart';
import 'medical_record3.dart';

class MedicalRecordCopy extends StatefulWidget {
  const MedicalRecordCopy({Key? key}) : super(key: key);
  final String id = 'MedicalRecord';
  @override
  State<MedicalRecordCopy> createState() => _MedicalRecordCopyState();
}

class _MedicalRecordCopyState extends State<MedicalRecordCopy> {
  bool _isExpandedDisease = false;
  bool _isExpandedMedicine = false;
  bool _isExpandedAllergy = false;
  bool _isExpandedOperation = false;
  MedicalRecordModel? _medicalRecord;
  AllergyInfoModel? allergy;
  void _toggleExpandDisease() {
    setState(() {
      _isExpandedDisease = !_isExpandedDisease;
    });
  }

  void _toggleExpandMedicine() {
    setState(() {
      _isExpandedMedicine = !_isExpandedMedicine;
    });
  }

  void _toggleExpandAllergy() {
    setState(() {
      _isExpandedAllergy = !_isExpandedAllergy;
    });
  }

  void _toggleExpandOperation() {
    setState(() {
      _isExpandedOperation = !_isExpandedOperation;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                MedicalRecordModel? medicalRecord =
                                    snapshot.data;

                                if (medicalRecord != null) {
                                  _medicalRecord = medicalRecord;
                                  DateTime today = DateTime.now();
                                  DateTime dob =
                                      DateTime.parse(medicalRecord.birthDate);
                                  int age = today.year - dob.year;

                                  return Column(children: [
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
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${medicalRecord.patientFirstName} ${medicalRecord.patientLastName}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: darkBlue,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${age.toString()} years old',
                                        style: const TextStyle(
                                            color: darkBlue,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.04),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: _toggleExpandOperation,
                                        child: const CustomTextRichInfo(
                                          text1: 'General ',
                                          text2: 'Info. ',
                                          text3: ':',
                                        ),
                                      ),
                                    ),
                                    AnimatedCrossFade(
                                      firstChild: const SizedBox.shrink(),
                                      secondChild:
                                          CustomGeneralBasicMedicalInfo(
                                              medicalRecord: medicalRecord),
                                      crossFadeState: _isExpandedOperation
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  ]);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleExpandDisease,
                      child: const CustomTextRichInfo(
                        text1: 'Diseases ',
                        text2: 'Info. ',
                        text3: ':',
                      ),
                    ),
                    CustomAddButton(
                      onTap: () {
                        Navigator.pushNamed(context, SignUp7().id);
                      },
                      borderRadius: 8,
                      plusIcon: true,
                      height: 20,
                      width: 20,
                      size: 20,
                    )
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: FutureBuilder<List<DiseaseInfoModel>>(
                    future: DiseaseInfoForRecord().getDiseaseInfo(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(height: screenHeight * 0.04);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<DiseaseInfoModel> diseaseList = snapshot.data!;
                        if (diseaseList.isEmpty) {
                          return const CustomDetailsInfoRow();
                        }
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
                                    },
                                  );
                                },
                                onPressed2: () {},
                                onPressed3: () {
                                  setState(() {
                                    DiseaseInfoForRecord().deleteDiseaseInfo(
                                      context: context,
                                      diseaseInfoModel: diseaseList[i],
                                    );
                                  });
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
                  crossFadeState: _isExpandedDisease
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleExpandMedicine,
                      child: const CustomTextRichInfo(
                        text1: 'Medication ',
                        text2: 'Info. ',
                        text3: ':',
                      ),
                    ),
                    CustomAddButton(
                      onTap: () {
                        if (_medicalRecord != null) {
                          Navigator.pushNamed(
                            context,
                            const SignUp8().id,
                            arguments: _medicalRecord!.medicalId,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Medical record is not available.'),
                            ),
                          );
                        }
                      },
                      borderRadius: 8,
                      plusIcon: true,
                      height: 20,
                      width: 20,
                      size: 20,
                    )
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: FutureBuilder<List<MedicalInfoModel>>(
                    future: MedicineInfoForRecordService()
                        .getMedicineInfoService(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(height: screenHeight * 0.04);
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
                                    },
                                  );
                                },
                                onPressed2: () {
                                  Navigator.pushNamed(
                                      context, MedicalRecord3.id, arguments: {
                                    'medicineId': medicineList[i]
                                  });
                                },
                                onPressed3: () {
                                  setState(() {
                                    MedicineInfoForRecordService()
                                        .deleteMedicineInfo(
                                      context: context,
                                      medicalInfoModel: medicineList[i],
                                    );
                                  });
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
                  crossFadeState: _isExpandedMedicine
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleExpandAllergy,
                      child: const CustomTextRichInfo(
                        text1: 'Allergies ',
                        text2: 'Info. ',
                        text3: ':',
                      ),
                    ),
                    CustomAddButton(
                      onTap: () {
                        Navigator.pushNamed(context, const SignUp9().id);
                      },
                      borderRadius: 8,
                      plusIcon: true,
                      height: 20,
                      width: 20,
                      size: 20,
                    )
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: FutureBuilder<List<AllergyInfoModel>>(
                    future: AllergyInfoForRecordService()
                        .getAllergyInfoService(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(height: screenHeight * 0.04);
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
                                    },
                                  );
                                },
                                onPressed2: () {
                                  if (_medicalRecord != null) {
                                    Navigator.pushNamed(
                                        context, const UpdateAllergyScreen().id,
                                        arguments: {
                                          _medicalRecord!.medicalId,
                                          allergy
                                        });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Medical record is not available.'),
                                      ),
                                    );
                                  }
                                },
                                onPressed3: () {
                                  setState(() {
                                    AllergyInfoForRecordService()
                                        .deleteAllergyInfo(
                                            context: context,
                                            allergyInfoModel: allergyList[i]);
                                  });
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
                  crossFadeState: _isExpandedAllergy
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _toggleExpandOperation,
                      child: const CustomTextRichInfo(
                        text1: 'Operations ',
                        text2: 'Info. ',
                        text3: ':',
                      ),
                    ),
                    CustomAddButton(
                      onTap: () {
                        Navigator.pushNamed(context, const SignUp10().id);
                      },
                      borderRadius: 8,
                      plusIcon: true,
                      height: 20,
                      width: 20,
                      size: 20,
                    )
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: FutureBuilder<List<OperationInfoModel>>(
                    future: OperationInfoForRecordService()
                        .getOperationInfoService(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(height: screenHeight * 0.04);
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
                                      'operationId':
                                          operationList[i].operationId
                                    },
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
                  crossFadeState: _isExpandedOperation
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextRichInfo(
                      text1: 'Relatives ',
                      text2: 'Info. ',
                      text3: ':',
                    ),
                    CustomAddButton(
                      onTap: () {
                        Navigator.pushNamed(context, const SignUp11().id);
                      },
                      borderRadius: 8,
                      plusIcon: true,
                      height: 20,
                      width: 20,
                      size: 20,
                    )
                  ],
                ),
                FutureBuilder<MedicalRecordModel>(
                  future: GetBasicMedicalInfo().getBasicMedicalInfo(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(height: screenHeight * 0.04);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      MedicalRecordModel? medicalRecord = snapshot.data;

                      if (medicalRecord != null) {
                        _medicalRecord = medicalRecord;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2ForFather().id,
                                  arguments: {'father': medicalRecord.father},
                                );
                              },
                              child: Text(
                                'Father',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.w600,
                                    color: darkBlue),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2ForMother().id,
                                  arguments: {'mother': medicalRecord.mother},
                                );
                              },
                              child: Text(
                                'Mother',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.w600,
                                    color: darkBlue),
                              )),
                          if (medicalRecord.second_degree != null)
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  const MedicalRecord2ForSecondDegree().id,
                                  arguments: {'second_degree': medicalRecord.second_degree},
                                );
                              },
                              child: Text(
                                'Second Degree',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.w600,
                                    color: darkBlue),
                              )),
                        ]);
                      } else {
                        return const Text('Error: Medical record data is null');
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: CustomButton(
                    text: 'Done',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
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
