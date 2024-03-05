import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/AppointmentListViewForDoctor.dart';
import 'package:med_eg/widgets/days_view.dart';

class DoctorCalendar extends StatefulWidget {
  const DoctorCalendar({super.key});
  final String id='DoctorCalendar';

  @override
  State<DoctorCalendar> createState() => _DoctorCalendarState();
}

class _DoctorCalendarState extends State<DoctorCalendar> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(children: [
          
           const Center(child: Text('Appointments',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: darkBlue),)),
            SizedBox(height: screenHeight*0.08,),
            Container(
                        width: screenWidth ,
                        height: 1,
                        color: lightGrey,
                      ),
                      DaysView(screenHeight: screenHeight, screenWidth: screenWidth),
                      SizedBox(height: screenHeight*0.05,),
                       Container(
                        width: screenWidth ,
                        height: 1,
                        color: lightGrey,
                      ),
                      AppointmentListViewForDoctor()
          
          ]),
      ),
      );
    
  }
}