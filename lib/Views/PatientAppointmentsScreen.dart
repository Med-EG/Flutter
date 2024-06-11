import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/message_screen.dart';
import 'package:med_eg/Views/patient_profile.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModelForPatientSide.dart';
import 'package:med_eg/services/get_Appointmnts_for_paitent.dart';
import 'package:med_eg/widgets/AppointmentCardForPatientSide.dart';

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
                     PatientHomeScreen().id,
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
               GButton(
                onPressed: (){
Navigator.pushReplacementNamed(context, const PatientProfile().id);
                },
                icon: Icons.person_3_rounded,
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<AppointmentModelForPatientSide>>(
        future: GetAllAppointmentService().GetAllAppontmentsForPatient(context),
        builder: (BuildContext context,
            AsyncSnapshot<List<AppointmentModelForPatientSide>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
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
                          fontWeight: FontWeight.bold,
                        ),
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
                          fontSize: 30,
                          color: Colors.grey.withOpacity(0.4),
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
            List<AppointmentModelForPatientSide> appointments = snapshot.data!;
            return Center(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      
                       // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const  SizedBox(height: 60,),
                          
                          const Text(
                            'My Appointments',
                            style: TextStyle(
                              color: darkBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                              child: Container(
                                height: 250,
                                child: ListView.builder(
                                  
                                  itemCount: appointments.length,
                                  itemBuilder: (context, index) {
                                    return AppointmentCardForPatientSide(
                                        appointment: appointments[index]);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ])));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
