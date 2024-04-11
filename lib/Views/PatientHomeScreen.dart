import 'package:flutter/material.dart';
import 'package:med_eg/Views/NoAlertScreen.dart';
import 'package:med_eg/Views/NoPatientAppointmentsScreen.dart';
import 'package:med_eg/Views/find_doctor.dart';
import 'package:med_eg/Views/message_screen.dart';
import 'package:med_eg/widgets/DoctorCardListView.dart';
import 'package:med_eg/widgets/customIconCard.dart';
import 'package:med_eg/widgets/customSearchBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../constants/colors.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});
  final String id='HomeScreen';

  @override
  Widget build(BuildContext context) {
      PatientInfo? patient =BlocProvider.of<LoginCubit>(context).patient;
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
            selectedIndex: 0,
            onTabChange: (value){},
            tabs: [
              const GButton(
                icon: Icons.home_rounded,
                text: 'home',
              ),
              GButton(
                onPressed: (){Navigator.pushNamed(context, const MessageScreen().id);},
                icon: Icons.chat_bubble_rounded,
                text: 'Chats',
              ),
              GButton(
                onPressed: (){Navigator.pushNamed(context, const NoPatientAppoointment().id);},

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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(34.5)),
            child: Image.network(
               'https://api-medeg.online/${patient!.personalImage}',
              // 'assets/images/PNG/PaitentPhotoInAppoinmtent.png',
              // height: 47,
              // width: 47,
              
            ),
          ),
        ),
        title:  Padding(
          padding:const EdgeInsets.only(top: 12),
          child: Row(
            children: [
             const Text(
                'Hello , ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                patient.firstName,
                style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
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
               Row(
                children: [
                const  Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: (){Navigator.popAndPushNamed(context,const FindDoctor().id);},
                    child: const IconCard(
                        image: 'assets/images/PNG/Stethoscope.png',
                        text: 'Doctors'),
                  ),
                 const Spacer(
                    flex: 1,
                  ),
                  IconCard(
                  onTap: () {
                    Navigator.pushNamed(context,const NoAlertScreen().id);
                  },
                    image: 'assets/images/PNG/Medicine_icon.png',
                    text: 'Medicine',
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const IconCard(
                      image: 'assets/images/PNG/Record_icon.png', text: 'Record'),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(height: 10,),

              //Need to adjust the image that is in miidile of home screen
              
              Image.asset('assets/images/PNG/AdobeStock_103968342_Preview.jpeg'),
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
                            TextStyle(color: kPrimaryColor, fontSize: 18),
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
