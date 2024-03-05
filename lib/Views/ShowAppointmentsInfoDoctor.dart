import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/Views/chat_screen.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModel.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

class ShowAppointmentInfoDoctor extends StatelessWidget {
 const ShowAppointmentInfoDoctor({super.key});
  final String id = 'DoctorShowAppointmentInfo';

  @override
  Widget build(BuildContext context) {
    var appointmentSelected =
        ModalRoute.of(context)!.settings.arguments as AppointmentModel;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
           const Positioned(
              right: -80, top: -80, child: CustomCircleContainer()),
          const Positioned(
              left: -180, bottom: -180, child: CustomCircleContainer()),
          Center(
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
                            style:const TextStyle(
                                color: darkBlue,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                                appointmentSelected.day,
                                style:const TextStyle(
                                    color: darkBlue,
                                    fontSize: 20,
                                   // fontWeight: FontWeight.w600
                                    ),
                              ),
                          Row(
                            children: [
                              
                              Text(
                                appointmentSelected.date,
                                style:const TextStyle(
                                    color: darkBlue,
                                    fontSize: 20,
                                   // fontWeight: FontWeight.w600
                                    ),
                              ),
                              Text(
                                appointmentSelected.time,
                                style:const TextStyle(
                                    color: darkBlue,
                                    fontSize: 20,
                                   // fontWeight: FontWeight.w600
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                     const Spacer(flex: 5,),
                      Image.asset(appointmentSelected.doctorImage,height: screenHeight*0.13,),
                     const Spacer(flex: 1,)
                    ],
                  ),
                  SizedBox(height: screenHeight*0.15,),
                 const CustomButton(text: 'View Medical Record', color: kPrimaryColor),
                  SizedBox(height: screenHeight*0.05,),
                  CustomButton(text: 'Go to chat', color: kPrimaryColor,onTap: () {
                   Navigator.pushNamed(context, ChatScreen().id);
                 },),
                  SizedBox(height: screenHeight*0.17,),
                 const CustomButton(text: 'Delete appointment', color: Color(0xffe24040)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
