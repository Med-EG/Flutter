import 'package:flutter/material.dart';
import 'package:med_eg/customWidgets/DoctorCardListView.dart';
import 'package:med_eg/customWidgets/customIconCard.dart';
import 'package:med_eg/customWidgets/customSearchBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
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
            activeColor:kPrimaryColor,
            gap: 8,
            onTabChange: (value){

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
                icon: Icons.person_3_rounded,
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(34.5)),
            child: Image.asset(
              'assets/images/PNG/UserPhoto.png',
              height: 47,
              width: 47,
              //color: Colors.black,
            ),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Row(
            children: [
              Text(
                'Hello , ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'User',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const Searchbar(),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  IconCard(
                      image: 'assets/images/PNG/Stethoscope.png',
                      text: 'Doctors'),
                  Spacer(
                    flex: 1,
                  ),
                  IconCard(
                    image: 'assets/images/PNG/Medicine_icon.png',
                    text: 'Medicine',
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  IconCard(
                      image: 'assets/images/PNG/Record_icon.png', text: 'Record'),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Image.asset('assets/images/PNG/Rectangle 31.png'),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text(
                      'Top Doctors',
                      style: TextStyle(
                          color: darkBlue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'See all',
                        style:
                            TextStyle(color: darkBlue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                
              ),
            const  SizedBox(height: 10,),
             const DoctorCardListView()
            ],
          ),
        ),
      ),
    );
  }
}
