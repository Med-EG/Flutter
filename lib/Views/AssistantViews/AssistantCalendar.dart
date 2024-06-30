import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/Views/AssistantViews/ModifyAppointmentView.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/helper/API.dart';
import 'package:med_eg/models/appointmentModelForDoctorSide.dart';
import 'package:med_eg/models/doctorAssistantModel.dart';
import 'package:med_eg/services/get_Appointments_for_doctor.dart';
import 'package:med_eg/widgets/Doctor_widgets/AppointmentCardForDoctorSide.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

class DoctorAssistantCalendar extends StatefulWidget {
  const DoctorAssistantCalendar({super.key});
  final String id = 'DoctorAssistantCalendar';

  @override
  State<DoctorAssistantCalendar> createState() => _DoctorCalendarState();
}

class _DoctorCalendarState extends State<DoctorAssistantCalendar> {
  @override
  Widget build(BuildContext context) {
    DoctorAssistant? assistant = BlocProvider.of<LoginCubit>(context).assistant;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              right: -80, top: -80, child: CustomCircleContainer()),
          const Positioned(
              left: -180, bottom: -180, child: CustomCircleContainer()),
          FutureBuilder<List<AppointmentModelForDoctorSide>>(
            future: GetAllAppointmentForDoctorService()
                .GetAllAppontmentsDoctor(context),
            builder: (BuildContext context,
                AsyncSnapshot<List<AppointmentModelForDoctorSide>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Row(
                            children: [
                             // const CustomArrowBack(),
                              const Text(
                  'Hello , ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  assistant!.name,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
                            ],
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          const Center(
                            child: Text(
                              'Appointments',
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Center(
                              child: Image.asset(
                                  'assets/images/PNG/Paper Negative.png')),
                          const Spacer(
                            flex: 1,
                          ),
                          Center(
                            child: Text(
                              'No Appointments',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.grey.withOpacity(0.4),
                              ),
                            ),
                          ),
                          const Spacer(
                            flex: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                List<AppointmentModelForDoctorSide> appointments = snapshot.data!;
                return Padding(
                    padding: const EdgeInsets.only(bottom:16,left: 17,right: 17,top:5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          //Spacer(flex: 1,),
                          Row(
                            children: [
                             const Spacer(flex: 1,),
                             // const CustomArrowBack(),
                              const Text(
                  'Hello , ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  assistant!.name,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
                            ],
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top:20),
                              child: Text(
                                'Appointments',
                                style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Center(
                                child: ListView.builder(
                                  itemCount: appointments.length,
                                  itemBuilder: (context, index) {
                                    return AppointmentCardForDoctorSide(
                                      appointment: appointments[index],
                                      ontap: () {
                                        Navigator.pushNamed(
                                          context,
                                         const ModifyAppointment().id,
                                          arguments: appointments[index]
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          CustomButton(
                            text: 'Log out',
                            color: const Color(0xffE24040),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text("Log out"),
                                      content:
                                         const Text("Are you sure you want to log out?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Yes"),
                                          onPressed: () {
                                            DoctorAssistant? assistant =
                                                BlocProvider.of<LoginCubit>(context)
                                                    .assistant;
                                            Api().post(
                                                url:
                                                    'https://api-medeg.online/api/medEG/doctor/assistant/logout',
                                                body: {},
                                                token: assistant!.token);
                                            SystemNavigator.pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("No"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ]);
                                },
                              );
                            },
                          )
                        ]));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
