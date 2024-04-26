import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_button.dart';

class SearchForMedicalRecordByFaceID extends StatelessWidget {
  const SearchForMedicalRecordByFaceID({super.key});
  final String id = 'SearchForMedicalRecordByFaceID';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
                left: 0,
                bottom: 0,
                child: Image.asset('assets/images/PNG/Frame.png')),
            Center(
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    height: 320,
                    width: 270,
                    color: kPrimaryColor,
                    child: Center(
                      child: Text(
                        'Scan will be here',
                        style: TextStyle(color: Colors.white,fontSize: 25),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(text: 'Scan'),
                  ),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
