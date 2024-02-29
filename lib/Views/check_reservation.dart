import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/custom_arrow_back.dart';
import 'package:med_eg/widgets/custom_button.dart';
import 'package:med_eg/widgets/custom_checkBox.dart';

import '../widgets/find_doctor_card.dart';
import '../widgets/success_signUp.dart';

class CheckReservation extends StatelessWidget {
  const CheckReservation({super.key});
  final String id = 'CheckReservation';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomArrowBack(),
              const FindDoctorCard(),
              SizedBox(height: screenHeight * 0.02),
              GreyLine(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.02),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: darkBlue),
                  ),
                  Text(
                    'Change',
                    style: TextStyle(
                        color: grey, fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month, color: kPrimaryColor),
                  SizedBox(width: screenWidth * 0.04),
                  const Text(
                    'Monday, Jun 23, 2023 | 6:00 PM',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: darkBlue),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              GreyLine(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.03),
              const Text(
                'Payment Details',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: darkBlue),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const CustomRow(
                text1: 'Consulation',
                text2: '300.00 L.E',
                color1: lightGrey,
                color2: darkBlue,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomRow(
                text1: 'Additional Fees',
                text2: '10.00 L.E',
                color1: lightGrey,
                color2: darkBlue,
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              const CustomRow(
                text1: 'Discount',
                text2: '00.00 L.E',
                color1: lightGrey,
                color2: darkBlue,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              GreyLine(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.02),
              const CustomRow(
                text1: 'Total',
                text2: '310.00 L.E',
                color1: darkBlue,
                color2: kPrimaryColor,
              ),
              SizedBox(height: screenHeight * 0.05),
              const Text(
                'Payment Details',
                style: TextStyle(
                    fontSize: 16, color: darkBlue, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.065,
                width: screenWidth,
                decoration: BoxDecoration(
                    border: Border.all(color: lightGrey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(Icons.account_balance_wallet_rounded,
                        color: kPrimaryColor),
                    const SizedBox(width: 16),
                    const Text(
                      'Cash',
                      style: TextStyle(
                          fontSize: 16,
                          color: darkBlue,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: screenWidth * 0.5),
                    const CustomCheckBox()
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        text: 'Confirm',
                        color: kPrimaryColor,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  actions: [
                                    Column(
                                      children: [
                                        SuccessSignUp(
                                            color: 0xffD9D9D9,
                                            image:
                                                'assets/images/SVG/Stroke 3.svg'),
                                        Text('Booked',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Text(
                                          'Your appointment has been successfully booked , you can have a consultation session with your trusted doctor',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: grey,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: CustomButton(
                                              text: 'Home',
                                              color: kPrimaryColor),
                                        ),
                                        CustomButton(
                                            text: 'Chat with Doctor',
                                            color: kPrimaryColor),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text2,
    required this.color2,
    required this.text1,
    required this.color1,
  });
  final String text1;
  final Color color1;
  final String text2;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
              color: color1, fontSize: 12, fontWeight: FontWeight.w600),
        ),
        Text(
          text2,
          style: TextStyle(
              fontSize: 12, color: color2, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class GreyLine extends StatelessWidget {
  const GreyLine({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 0.5,
        width: screenWidth * 0.4,
        color: grey,
      ),
    );
  }
}
