/*  import 'package:flutter/material.dart';
import 'package:med_eg/widgets/time_card.dart';

class TimeView extends StatefulWidget {
  const TimeView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  int? selectedCardId;
     void handleCardTap(int id) {
    setState(() {
      selectedCardId = id;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenHeight * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TimeCard(
               id: workingDay.doctorID,
                    // ignore: unrelated_type_equality_checks
                    isSelected: selectedCardId  == workingDay.doctorID,
                    onTap: handleCardTap,
            width: widget.screenWidth * 0.25, borderRadius: 24),
          );
        },
      ),
    );
  }
}  */