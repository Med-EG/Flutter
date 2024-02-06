import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/customWidgets/customButton.dart';
import 'package:med_eg/screens/loginScreen.dart';

class ChooseUserType extends StatelessWidget {
   ChooseUserType({super.key});
  String id='ChooseUserType';

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          children: [
             SizedBox(height: screenHieght*0.06,),
              Container(
                height: screenHieght*0.3,
                child: SvgPicture.asset('assets/SVG/Frame.svg')),
                SizedBox(height: screenHieght*0.007,),
                const Text('You are a...',style: TextStyle(fontSize: 35,color: Color(kTextColor),fontWeight: FontWeight.bold),),
                 SizedBox(height: screenHieght*0.08,),
                CustomButton(customButtonText: 'Patient', routeName: Login().id),
                 SizedBox(height: screenHieght*0.035,),
                CustomButton(customButtonText: 'Doctor', routeName: Login().id),
                 SizedBox(height: screenHieght*0.035,),
                CustomButton(customButtonText: 'Doctor assistant', routeName: Login().id)
      
          ],
        ),
      ),
    );
  }
}