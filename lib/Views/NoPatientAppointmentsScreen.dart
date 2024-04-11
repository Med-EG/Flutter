import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/message_screen.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModel.dart';
import 'package:med_eg/services/get_Appointmnts_for_paitent.dart';
import 'package:med_eg/widgets/customAppointmentCard.dart';

class NoPatientAppoointment extends StatelessWidget {
  const NoPatientAppoointment({super.key});
  final String id = 'NoPatientAppoointment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.3))),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: GNav(
            selectedIndex: 2,
            tabBackgroundColor: kPrimaryColor.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            backgroundColor: Colors.white,
            activeColor: kPrimaryColor,
            gap: 8,
            onTabChange: (value) {},
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    const PatientHomeScreen().id,
                  );
                },
                icon: Icons.home_rounded,
                text: 'home',
              ),
              GButton(
                onPressed: () {
                  Navigator.pushNamed(context, const MessageScreen().id);
                },
                icon: Icons.chat_bubble_rounded,
                text: 'Chats',
              ),
              GButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    const NoPatientAppoointment().id,
                  );
                },
                icon: Icons.edit_calendar_rounded,
                text: 'Appointments',
              ),
              const GButton(
                icon: Icons.person_3_rounded,
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<AppointmentModel>>(
        future: GetAllAppointmentService().GetAllAppontmentsForPatient(context),
        builder: (BuildContext context,
            AsyncSnapshot<List<AppointmentModel>> snapshot) {
          if (snapshot.hasData) {
            List<AppointmentModel> appointments = snapshot.data!;
            return ListView.builder(
              itemBuilder:(context,index){
                      return AppointmentCard(appointment: appointments[index]);}
            ) ; 
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    const Text(
                      'Appointments',
                      style: TextStyle(
                          color: darkBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Image.asset('assets/images/PNG/Paper Negative.png'),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'No Appointments',
                      style: TextStyle(
                          fontSize: 30, color: Colors.grey.withOpacity(0.4)),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
