import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_eg/Views/PatientAppointmentsScreen.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/message_screen.dart';
import 'package:med_eg/Views/patient_profile.dart';
import 'package:med_eg/constants/colors.dart';

class DefaultView extends StatefulWidget {
  const DefaultView({super.key});
 final String id='DefaultView';
  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  int _currentindex = 0;
  List <Widget>views=<Widget>[const PatientHomeScreen(),const MessageScreen(),const PatientAppoointment(),const PatientProfile()];
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
            
            tabBackgroundColor: kPrimaryColor.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            backgroundColor: Colors.white,
            activeColor: kPrimaryColor,
            gap: 8,
            selectedIndex: _currentindex ,
            onTabChange: (index) {
              setState(() {
                _currentindex=index;
              });
            },
            tabs:const [
               GButton(
                icon: Icons.home_rounded,
                text: 'home',
              ),
              GButton(
                
                icon: Icons.chat_bubble_rounded,
                text: 'Chats',
              ),
              GButton(
               
                icon: Icons.edit_calendar_rounded,
                text: 'Appointments',
              ),
              GButton(
                text: 'Profile',
                icon: Icons.person_3_rounded,
                
              )
            ],
          ),
        ),
      ),
      body: views.elementAt(_currentindex),
    );
  }
}