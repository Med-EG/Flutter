import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:med_eg/Views/PatientHomeScreen.dart';
import 'package:med_eg/Views/PatientAppointmentsScreen.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/cubits/MessageCubit/message_cubit.dart';
import 'package:med_eg/widgets/message_list_tile.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});
  final String id = 'MessageScreen';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocConsumer<MessageCubit, MessageState>(
        listener: (context, state) {
          if (state is MessageSuccess) {
            print('Message Sent Successfully');
          } else if (state is MessageFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something went wrong')));
            print(state.errMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GNav(
                  selectedIndex: 1,
                  tabBackgroundColor: kPrimaryColor.withOpacity(0.2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
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
                      text: 'Home',
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
                    ),
                  ],
                ),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    const Text(
                      'Message',
                      style: TextStyle(
                          color: darkBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    const MessageListTileForPatient(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
