import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:med_eg/Views/DoctorViews/ShowAppointmentsInfoDoctor.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModelForDoctorSide.dart';
import 'package:med_eg/services/get_Appointments_for_doctor.dart';
import 'package:med_eg/widgets/Doctor_widgets/AppointmentCardForDoctorSide.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';

class DoctorCalendar extends StatefulWidget {
  const DoctorCalendar({super.key});
  final String id = 'DoctorCalendar';

  @override
  State<DoctorCalendar> createState() => _DoctorCalendarState();
}

class _DoctorCalendarState extends State<DoctorCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AppointmentModelForDoctorSide>>(
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
                      const CustomArrowBack(),
                      const Spacer(
                        flex: 3,
                      ),
                     const Center(
                        child:  Text(
                          'My Appointments',
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
                      Center(child: Image.asset('assets/images/PNG/Paper Negative.png')),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      //Spacer(flex: 1,),
                      const CustomArrowBack(),
                      const Center(
                        child: Text(
                          'My Appointments',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Center(
                            child: Container(
                              child: ListView.builder(
                                itemCount: appointments.length,
                                itemBuilder: (context, index) {
                                  return AppointmentCardForDoctorSide(
                                    appointment: appointments[index],
                                    ontap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ShowAppointmentInfoDoctor(),
                                          settings: RouteSettings(
                                            arguments: appointments[
                                                index], // Pass a single AppointmentModelForDoctorSide
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
