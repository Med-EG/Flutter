import 'package:flutter/material.dart';
import 'package:med_eg/Views/faqs_screen.dart';
import 'package:med_eg/Views/profile03.dart';
import 'package:med_eg/Views/signUp2.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/services/Log%20Out%20service.dart';
import 'package:med_eg/widgets/custom_button.dart';
import '../widgets/top_half_blue.dart';
import 'chooseUserType.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});
  final String id = 'PatientProfile';
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
       onWillPop: () async {
        return await _showExitConfirmationDialog(context);
      },
      child: Scaffold(
          body: Column(
        children: [
          const TopHalfBlueScreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CustomButton(text: 'Edit Profile', color: kPrimaryColor,
            onTap: () {
              Navigator.pushNamed(context, const SignUp2().id);
            },),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                CustomButton(text: 'General medical info.', color: kPrimaryColor,
               onTap: () {
                 Navigator.pushNamed(context, const Profile03().id);
               },
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CustomButton(text: 'FAQs', color: kPrimaryColor,
             onTap: () {
              Navigator.pushNamed(context, const FAQSScreen().id);
            },),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CustomButton(text: 'Log out', color: Colors.red),
          ),
        ],
      )),
    );
  }
}
 Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
