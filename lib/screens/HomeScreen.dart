import 'package:flutter/material.dart';
import 'package:med_eg/customWidgets/customIconCard.dart';
import 'package:med_eg/customWidgets/customSearchBar.dart';

import '../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left:12,top:12),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(34.5)),
            child: Image.asset(
              'assets/images/PNG/UserPhoto.png',
              height: 47,
              width: 47,
              //color: Colors.black,
            ),
          ),
        ),
        title:const Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text('Hello..User'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(children: [
          Searchbar(),
          IconCard(image: 'assets/images/PNG/images/Stethoscope.png')
        ],),
      ),
    );
  }
}

