import 'package:flutter/material.dart';

class SignUp4 extends StatelessWidget {
  const SignUp4({super.key});
final String id = 'SignUp4';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container positioned at the top left corner
            Positioned(
              right: -100,
              top: 20,
              child: Container(
                width: screenWidth*0.99,
                height: screenHeight*0.4,
                decoration: const BoxDecoration(
                    color: Color(0xffe5ecfa),
                    shape: BoxShape.circle),
                child: const Center(),
              ),
            ),
             Positioned(
              left: -80,
              bottom: -80,
              child: Container(
                width: screenWidth*0.5,
                height: screenHeight*0.5,
                decoration: BoxDecoration(
                    color: const Color(0xffe5ecfa),
                    borderRadius: BorderRadius.circular(200)),
                child: const Center(),
              ),
            ),
            const Center(child: Text('Welcome to medical record' ,style:TextStyle(fontSize: 32) ,)),
           
          ],
        ),
      ),
    );
  }
}
