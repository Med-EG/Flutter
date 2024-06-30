import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/Views/AssistantViews/AssistantCalendar.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/DoctorWorkingDaysModel.dart';
import 'package:med_eg/models/appointmentModelForDoctorSide.dart';
import 'package:med_eg/models/doctorAssistantModel.dart';
import 'package:med_eg/services/CheckAppointentAvalbilityService.dart';
import 'package:med_eg/services/get_all_WorkinDaysForDoctor.dart';
import 'package:med_eg/widgets/TimePicker.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';
import 'package:med_eg/widgets/custom_date_Picker.dart';

class ModifyAppointment extends StatefulWidget {
  const ModifyAppointment({super.key});
  final String id = 'ModifyAppointment';

  @override
  State<ModifyAppointment> createState() => _ModifyAppointmentState();
}

class _ModifyAppointmentState extends State<ModifyAppointment> {
  String selectedTimee = '';
  String selectedDate = '';
  bool isDoctoreWorkinhgThatDay = false;
  @override
  Widget build(BuildContext context) {
    DoctorAssistant? assistant = BlocProvider.of<LoginCubit>(context).assistant;
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
                      const Spacer(flex: 1),
                      SvgPicture.asset(
                        'assets/images/SVG/Frame (1).svg',
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.5,
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      const Spacer(flex: 1),
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
                                    color: darkBlue, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(flex: 4),
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
                      const Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  DatePicker(
                    onDateSelected: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    intialeDate: appointmentSelected.date,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  TimePicker(
                    onTimeSelected: (value) {
                      setState(() {
                        selectedTimee = value;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  CustomButton(
                    text: "Save changes",
                    onTap: () async {
                      List<WorkingDaysModel> workingDays =
                          await GetWorkingDaysForDoctorService()
                                  .getWorkingDaysForDoctor(context);
                              

                      if (selectedTimee == '' || selectedDate == '') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Time or date isn't selected"),
                              content: const Text(
                                  "please make sure you selecet the new time and new date"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        for (int i = 0; i < workingDays.length; i++) {
                          if (DateTime.parse(selectedDate) ==
                              workingDays[i].day) {
                            isDoctoreWorkinhgThatDay = false;
                            break;
                          }
                        }
                        if (isDoctoreWorkinhgThatDay == true) {
                          bool isAvailable =
                              await CheckAppointmentAvailabilityService(
                            dateToCheck: selectedDate,
                            timeToCheck: selectedTimee,
                          ).checkAppointmentAvailability(context);

                          if (isAvailable) {
                            await Api().put(
                              url:
                                  "https://api-medeg.online/api/medEG/appointment/${appointmentSelected.appointmentID}",
                              body: {
                                'doctor_id': assistant!.doctorID.toString(),
                                "patient_id":
                                    appointmentSelected.patientID.toString(),
                                "appointment_date": selectedDate,
                                "appointment_time": selectedTimee,
                                "price": appointmentSelected.price.toString(),
                              },
                              token: assistant.token,
                            );
                            Navigator.pushReplacementNamed(
                                context, const DoctorAssistantCalendar().id);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:const Text("Time Not Available"),
                                  content:const Text(
                                      "The selected time is not available."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("That day isn't available"),
                                content: const Text(
                                    "The doctore is not available on the day you selected"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child:const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
