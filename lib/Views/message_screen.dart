import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_eg/constants/colors.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SvgPicture.asset('assets/images/SVG/Frame (1).svg'),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Medical Record ID',
                  style: TextStyle(
                      color: darkBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                const Text(
                  '# 123456',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                 SingleChildScrollView(
                  child: Column(
                    children: [
                     
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
