import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/models/appointmentModelForPatientSide.dart';
import 'package:med_eg/services/get_Appointmnts_for_paitent.dart';
import 'package:med_eg/widgets/AppointmentCardForPatientSide.dart';

class PatientAppoointment extends StatelessWidget {
  const PatientAppoointment({super.key});
  final String id = 'NoPatientAppoointment';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        return await _showExitConfirmationDialog(context);
      },
      child: Scaffold(
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
      ),
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
