// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/operationInfoModel.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import '../services/operation Service.dart';
import '../widgets/custom_circle_container.dart';

class MedicalRecord2ForOperation extends StatelessWidget {
  const MedicalRecord2ForOperation({super.key});
  final String id = 'MedicalRecord2ForOperation';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey('operationId')) {
      return SafeArea(
        child: FutureBuilder<List<OperationInfoModel>>(
          future: OperationInfoForRecordService().getOperationInfoService(context),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<OperationInfoModel>? operationInfoModel = snapshot.data;
              if (operationInfoModel != null) {
                final int operationIdd = args['operationId'];
                final OperationInfoModel operationInfo =
                    operationInfoModel.firstWhere(
                  (info) => info.operationId == operationIdd,
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
                                  'Operation',
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
                                            'Operation Name: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(operationInfo.operationName,
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
                                            'Operation Date: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text('${operationInfo.operationDate}',
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
                                            'Surgeon Name: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text('${operationInfo.surgeonName}',
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
                                            'Operation notes: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: darkBlue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text('${operationInfo.notes}',
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
