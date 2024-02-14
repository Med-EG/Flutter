import 'package:flutter/material.dart';

class OnBordingModel  {
  OnBordingModel(
      {required this.imagePath,
      required this.firstDotColor,
      required this.secondDotColor,
      required this.thirdDotColor,
      required this.homeBordingTitle,
      required this.homeBordingDescreption,
      required this.isThisLastHomeBordingScreen});

  String imagePath;
  Color firstDotColor;
  Color secondDotColor;
  Color thirdDotColor;
  String homeBordingTitle;
  String homeBordingDescreption;
  bool isThisLastHomeBordingScreen = true;
 
}
 List<OnBordingModel>onBoardingScreens=<OnBordingModel>[
    OnBordingModel(imagePath: 'assets/images/PNG/firstHomeBordong.png', firstDotColor: Colors.black,
    secondDotColor: Colors.transparent, thirdDotColor: Colors.transparent,homeBordingTitle: 'Welcome to',
    homeBordingDescreption: 'Securely store, access, and manage your medical records anytime, anywhere',
    isThisLastHomeBordingScreen: false),

    OnBordingModel(imagePath: 'assets/images/PNG/secondHomeBording.png', firstDotColor: Colors.transparent,
    secondDotColor: Colors.black, thirdDotColor: Colors.transparent,homeBordingTitle: 'Never miss a dose!',
    homeBordingDescreption: 'MedEG helps you manage medications effortlessly. Receive reminders',
    isThisLastHomeBordingScreen: false),

    OnBordingModel(imagePath: 'assets/images/PNG/thirdHomeBording.png', firstDotColor: Colors.transparent,
    secondDotColor: Colors.transparent, thirdDotColor: Colors.black,homeBordingTitle: 'Book your appointments',
    homeBordingDescreption: 'Book appointments easily and Fast',
    isThisLastHomeBordingScreen: true),

  ];
