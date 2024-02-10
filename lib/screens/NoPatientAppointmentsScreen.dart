import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';

class NoPatientAppoointment extends StatelessWidget {
  const NoPatientAppoointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    color: Color(kTextColor),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
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
                    fontSize: 30, color: Colors.grey.withOpacity(0.4)),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
