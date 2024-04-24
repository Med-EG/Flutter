  import 'package:flutter/material.dart';
  import 'package:med_eg/widgets/CustomCardForDoctorHomeScreen.dart';

  class DoctorHomePageCardListView extends StatelessWidget {
    DoctorHomePageCardListView({super.key});

    final List<CustomCardForDoctorHomeScreen> cards = [
       CustomCardForDoctorHomeScreen(
          text: 'Appointments', icon: Icon(Icons.edit_calendar_rounded),ontap: (){},),
       CustomCardForDoctorHomeScreen(
          text: 'MedicalRecord', icon: Icon(Icons.article_rounded),ontap: (){},),
       CustomCardForDoctorHomeScreen(
          text: 'My Profile', icon: Icon(Icons.person_3_rounded),ontap: (){},),
           CustomCardForDoctorHomeScreen(
          text: 'Chats', icon: Icon(Icons.chat_bubble_rounded),ontap: (){},),
    ];
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          itemCount: cards.length,
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 3,
              mainAxisSpacing: 60),
          itemBuilder: (BuildContext context, int index) {
            return cards[index];
          },
        ),
      );
    }
  }
