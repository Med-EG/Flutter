import 'package:flutter/material.dart';
import 'package:med_eg/Views/DoctorViews/Doctor%20Profile.dart';
import 'package:med_eg/Views/DoctorViews/SearchForPatientMedicalRecord.dart';
import 'package:med_eg/widgets/Doctor_widgets/CustomCardForDoctorHomeScreen.dart';

class DoctorHomePageCardListView extends StatelessWidget {
  DoctorHomePageCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomCardForDoctorHomeScreen> cards = [
      CustomCardForDoctorHomeScreen(
        text: 'Appointments',
        icon:Icons.edit_calendar_rounded,
        ontap: () {
          
        }, height: 200, width: 125,
      ),
      CustomCardForDoctorHomeScreen(
        text: 'MedicalRecord',
        icon:  Icons.article_rounded,
        ontap: () {
          Navigator.pushNamed(context,const SearchForPatientMedicalRecord().id);
        },height: 200, width: 125
      ),
      CustomCardForDoctorHomeScreen(
        text: 'My Profile',
        icon:Icons.person_3_rounded,
        ontap: () {
          Navigator.pushNamed(context, const DoctorProfile().id);
        },height: 200, width: 125
      ),
      CustomCardForDoctorHomeScreen(
        text: 'Chats',
        icon:Icons.chat_bubble_rounded,
        ontap: () {},height: 200, width: 125
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: cards.length,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            crossAxisSpacing: 25,
            mainAxisSpacing: 50),
        itemBuilder: (BuildContext context, int index) {
          return cards[index];
        },
      ),
    );
  }
}
