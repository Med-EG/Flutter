import 'package:flutter/material.dart';
import 'package:med_eg/Views/DoctorViews/SearchForMedicalRecordByFaceID.dart';
import 'package:med_eg/Views/DoctorViews/SearchForMedicalRecordByID.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/Doctor_widgets/CustomCardForDoctorHomeScreen.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';

class SearchForPatientMedicalRecord extends StatelessWidget {
  const SearchForPatientMedicalRecord({super.key});
  final String id = 'SearchForPatientMedicalRecord';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset('assets/images/PNG/Frame.png')),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/PNG/AppLogo.png',
                height: 50,
              ),
              const Spacer(
                flex: 1,
              ),
              const Row(
                children: [
                  CustomArrowBack(),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        'Search for record ',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                       Text(
                        ' by...',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              CustomCardForDoctorHomeScreen(
                  text: 'ID',
                  icon: Icons.person_search_rounded,
                  ontap: () {
                     Navigator.pushNamed(
                        context, SearchForMedicalRecordByID().id);
                  },
                  height: 140,
                  width: 300),
              Spacer(
                flex: 1,
              ),
              CustomCardForDoctorHomeScreen(
                  text: 'Face ID',
                  icon: Icons.face_6_rounded,
                  ontap: () {
                    Navigator.pushNamed(
                        context, SearchForMedicalRecordByFaceID().id);
                  },
                  height: 140,
                  width: 300),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
