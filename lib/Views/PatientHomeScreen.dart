import 'package:flutter/material.dart';
import 'package:med_eg/Views/PatientAlertsScreen.dart';
import 'package:med_eg/Views/find_doctor.dart';
import 'package:med_eg/Views/medical_record.dart';
import 'package:med_eg/Views/medical_record_copy.dart';
import 'package:med_eg/cubits/LoginCubit/login_cubit.dart';
import 'package:med_eg/widgets/AutoCompleteSearch.dart';
import 'package:med_eg/widgets/DoctorCardListView.dart';
import 'package:med_eg/widgets/customIconCard.dart';
import '../constants/colors.dart';
import 'package:med_eg/models/paitentModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PatientHomeScreen extends StatelessWidget {
   const PatientHomeScreen({super.key});
  final String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    PatientInfo? patient = BlocProvider.of<LoginCubit>(context).patient; 
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(context);
      },
      child: Scaffold(
       
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: SizedBox(
              width: 70,
              height: 70,
              child: ClipOval(
                child: Image.network(
                  fit: BoxFit.cover,
                 'https://api-medeg.online/${patient!.personalImage}',
                  
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                const Text(
                  'Hello , ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  patient.firstName,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                const MySearchApp(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, const FindDoctor().id);
                      },
                      child: const IconCard(
                          image: 'assets/images/PNG/Stethoscope.png',
                          text: 'Doctors'),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    IconCard(
                      onTap: () {
                        Navigator.pushNamed(context, PatientAlertsScreen().id);
                      },
                      image: 'assets/images/PNG/Medicine_icon.png',
                      text: 'Medicine',
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    IconCard(
                        onTap: () {
                          Navigator.pushNamed(context, const MedicalRecordCopy().id);
                        },
                        image: 'assets/images/PNG/Record_icon.png',
                        text: 'Record'),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                 SizedBox(
                  height:  screenHieght*.02,
                ),
      
                SizedBox(
                  height: screenHieght*.23,
                  child: Image.asset(
                    fit: BoxFit.fill,
                      'assets/images/PNG/HomePageImage.png'),
                ),
                 SizedBox(
                  height:  screenHieght*.025,
                ),
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
                          style: TextStyle(color: kPrimaryColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  height:  screenHieght*.025,
                ),
                const DoctorCardListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }