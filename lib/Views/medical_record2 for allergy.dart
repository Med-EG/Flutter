import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/allergyInfoModel.dart';
import 'package:med_eg/services/allergy%20Service.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import '../widgets/custom_circle_container.dart';

class MedicalRecord2ForAllergy extends StatelessWidget {
  const MedicalRecord2ForAllergy({super.key});
  final String id = 'MedicalRecord2ForAllergy';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('allergyId')) {
      return SafeArea(
        child: FutureBuilder<List<AllergyInfoModel>>(
          future: AllergyInfoForRecordService().getAllergyInfoService(context),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<AllergyInfoModel>? allergyInfoModel = snapshot.data;
              if (allergyInfoModel != null) {
                final int allergyIdd = args['allergyId'];
                final AllergyInfoModel allergyInfo =
                    allergyInfoModel.firstWhere(
                  (info) => info.allergyId == allergyIdd,
                );
                return Scaffold(
                  body: Stack(
                    children: [
                      const Positioned(
                          right: -80, top: -80, child: CustomCircleContainer()),
                      const Positioned(
                          left: -180,
                          bottom: -180,
                          child: CustomCircleContainer()),
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
                                  'Allergy',
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
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Allergy Name: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(allergyInfo.allergyName,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Allergy Type: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(allergyInfo.allergyType,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Severity Level: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text('${allergyInfo.severityLevel}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                       SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Body Response: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text('${allergyInfo.bodyResponse}',
                                              style: const TextStyle(
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
                );
              }
            }
            // Add a default return statement
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('No Disease provided'),
        ),
      );
    }
  }
}
