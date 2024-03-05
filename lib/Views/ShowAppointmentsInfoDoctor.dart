import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModel.dart';
import 'package:med_eg/models/doctorInfoModel.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';

class ShowAppointmentInfoDoctor extends StatelessWidget {
  ShowAppointmentInfoDoctor({super.key});
  final String id = 'DoctorShowAppointmentInfo';

  @override
  Widget build(BuildContext context) {
    var appointmentSelected =
        ModalRoute.of(context)!.settings.arguments as AppointmentModel;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 const CustomArrowBack(),
                 const Spacer(flex: 1,),
                  SvgPicture.asset(
                    'assets/images/SVG/Frame (1).svg',
                    height: screenHeight * 0.1,
                    width: screenWidth*0.5,
                  ),
                  const Spacer(flex:1,),

                ],
              ),
              SizedBox(height: screenHeight*0.05,),
              Row(
                children: [
                  Spacer(flex: 1,),
                  Column(
                    children: [
                      Text(
                        appointmentSelected.doctorName,
                        style: TextStyle(
                            color: darkBlue,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                            appointmentSelected.day,
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 20,
                               // fontWeight: FontWeight.w600
                                ),
                          ),
                      Row(
                        children: [
                          
                          Text(
                            appointmentSelected.date,
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 20,
                               // fontWeight: FontWeight.w600
                                ),
                          ),
                          Text(
                            appointmentSelected.time,
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 20,
                               // fontWeight: FontWeight.w600
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(flex: 5,),
                  Image.asset(appointmentSelected.doctorImage,height: screenHeight*0.13,),
                  Spacer(flex: 1,)
                ],
              ),
              SizedBox(height: screenHeight*0.15,),
              CustomButton(text: 'View Medical Record', color: kPrimaryColor),
              SizedBox(height: screenHeight*0.05,),
              CustomButton(text: 'Go to chat', color: kPrimaryColor),
              SizedBox(height: screenHeight*0.17,),
              CustomButton(text: 'Delete appointment', color: Color(0xffe24040)),
            ],
          ),
        ),
      ),
    );
  }
}
