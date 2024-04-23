import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/CustomAddButton.dart';


class NoAlertScreen extends StatelessWidget {
  const NoAlertScreen({super.key});
final String id = 'NoAlertScreen';
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
                'Medicine alerts',
                style: TextStyle(
                    color: darkBlue,
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
                'No Alerts',
                style: TextStyle(
                    fontSize: 30, color: Colors.grey.withOpacity(0.4)),
              ),
              const Spacer(
                flex: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Spacer(flex: 1,),
                  CustomAddButton(
                  borderRadius: 40,
                  plusIcon : true,
                ),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
