import 'package:flutter/material.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import '../constants/colors.dart';
import '../services/GetBasicMedicalInfo.dart';

class TopHalfBlueScreen extends StatelessWidget {
  const TopHalfBlueScreen({Key? key}) : super(key: key);

 @override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      Container(
        height: screenHeight * 0.4,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(screenWidth, 50),
          ),
        ),
        child: Center(
          child: FutureBuilder<MedicalRecordModel>(
            future: GetBasicMedicalInfo().getBasicMedicalInfo(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                MedicalRecordModel? medicalRecord = snapshot.data;
                if (medicalRecord != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.black,
                        ),
                        child: Image.asset('assets/images/PNG/UserPhoto.png'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Anas Osama",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                '27',
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              const Text(
                                'Age',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${medicalRecord.height}',
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              const Text(
                                'Height',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${medicalRecord.weight}',
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              const Text(
                                'Weight',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                } else {
                  return const Text('Error: Medical record data is null');
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    ],
  );
}
}
