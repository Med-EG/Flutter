import 'package:flutter/material.dart';
import 'package:med_eg/models/DoctorWorkingDaysModel.dart';
import 'package:med_eg/services/get_all_WorkinDaysForDoctor.dart';
import 'package:med_eg/widgets/time_card.dart';

/* class DaysView extends StatefulWidget {
  const DaysView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<DaysView> createState() => _DaysViewState();
}

class _DaysViewState extends State<DaysView> {
  int? selectedCardId;
  void handleCardTap(int id) {
    setState(() {
      selectedCardId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight * 0.12,
      child: FutureBuilder<List<WorkingDaysModel>>(
          future:
              GetWorkingDaysForDoctorService().getWorkingDaysForDoctor(context),
          builder: (BuildContext context,
              AsyncSnapshot<List<WorkingDaysModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(); // You can change this to a loading indicator if needed
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 16),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final workingDay = snapshot.data![index];
                  return TimeCard(
                    id: workingDay.doctorID,
                    // ignore: unrelated_type_equality_checks
                    isSelected: selectedCardId == workingDay.doctorID,
                    onTap: handleCardTap,
                    width: widget.screenWidth * 0.12,
                    borderRadius: 16,
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
            return const Center(child: Text('There is no working days to show'));
          }),
    );
  }
}
 */
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
              GetWorkingDaysForDoctorService().getWorkingDaysForDoctor(context),
          builder: (BuildContext context,
              AsyncSnapshot<List<WorkingDaysModel>> snapshot) {
            if (snapshot.hasData) {
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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