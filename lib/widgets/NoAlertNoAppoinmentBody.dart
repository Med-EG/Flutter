import 'package:flutter/material.dart';

class NoAlertNoAppoinmentBody extends StatelessWidget {
  const NoAlertNoAppoinmentBody({super.key,required this.noWahtText});
 final noWahtText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/PNG/Paper Negative.png'),
                  const  SizedBox(height: 30,),
                    Text(
                      noWahtText,
                      style: TextStyle(
                          fontSize: 30, color: Colors.grey.withOpacity(0.4)),
                    ),
      ],
    );
  }
}