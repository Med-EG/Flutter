// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/Views/DoctorViews/DoctorCalendar.dart';
import 'package:med_eg/Views/chatTest.dart';
import 'package:med_eg/Views/medical_record.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/cubits/MedicalRecordCubit/medical_record_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/appointmentModelForDoctorSide.dart';
import 'package:med_eg/models/doctorModel.dart';
import 'package:med_eg/models/medicalRecordModel.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

class ShowAppointmentInfoDoctor extends StatelessWidget {
  const ShowAppointmentInfoDoctor({super.key});
  final String id = 'ShowAppointmentInfoDoctor';

  @override
  Widget build(BuildContext context) {
    DoctorModel? doctor = BlocProvider.of<LoginCubit>(context).doctor;
    var appointmentSelected = ModalRoute.of(context)!.settings.arguments
        as AppointmentModelForDoctorSide;

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
                      const Spacer(
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/images/SVG/Frame (1).svg',
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.5,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        children: [
                          Text(
                            appointmentSelected.patientFirstName,
                            style: const TextStyle(
                                color: darkBlue,
                                fontSize: 26,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                appointmentSelected.date,
                                style: const TextStyle(
                                  color: darkBlue,
                                  fontSize: 20,
                                  // fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipOval(
                          child: Image.network(
                            'https://api-medeg.online/${appointmentSelected.patientImage}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  CustomButton(
                    onTap: () async {
                      BlocProvider.of<MedicalRecordCubit>(context).patientID =
                          appointmentSelected.patientID;
                      // ignore: non_constant_identifier_names
                      final Response = await Api().get(
                          url:
                              'https://api-medeg.online/api/medEG/record/patient/${appointmentSelected.patientID}',
                          token: doctor!.token);
                      MedicalRecordModel? record =
                          MedicalRecordModel.fromJson(Response);
                      BlocProvider.of<MedicalRecordCubit>(context)
                          .patientIDGetByDoctorSearch = record.medicalId;

                      Navigator.pushNamed(context, MedicalRecord().id);
                    },
                    text: 'View Medical Record',
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  CustomButton(
                    text: 'Go to chat',
                    color: kPrimaryColor,
                    onTap: () {
                      Navigator.pushNamed(context,  ChatTest().id);
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.15,
                  ),
                  CustomButton(
                    text: 'Delete appointment',
                    color: const Color(0xffe24040),
                    onTap: () async {
                      await Api().delete(
                          url:
                              'https://api-medeg.online/api/medEG/appointment/${appointmentSelected.appointmentID}',
                          token: doctor!.token);
                      Navigator.pushReplacementNamed(context, DoctorCalendar().id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
