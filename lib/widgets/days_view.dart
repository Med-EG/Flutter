import 'package:flutter/material.dart';
import 'package:med_eg/models/DoctorWorkingDaysModel.dart';
import 'package:med_eg/models/doctorModel%20without%20token.dart';
import 'package:med_eg/services/get_all_WorkinDaysForDoctor.dart';
import 'package:med_eg/widgets/time_card.dart';

class DaysView extends StatelessWidget {
  const DaysView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.12,
      child: FutureBuilder<List<WorkingDaysModel>>(
          future:
              GetWorkingDaysForDoctorService().GetWorkingDaysForDoctor(context),
          builder: (BuildContext context,
              AsyncSnapshot<List<WorkingDaysModel>> snapshot) {
            if (snapshot.hasData) {
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 16),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return TimeCard(
                    width: screenWidth * 0.12,
                    borderRadius: 16,
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
            return const Scaffold(
              body: Center(
                child: Text(
                  'There no working days to show',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            );
          }),
    );
  }
}
