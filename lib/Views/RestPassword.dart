import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/Views/EnterVarifecationCode.dart';
import 'package:med_eg/widgets/custom_circle_container.dart';

import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  final String id = 'ResetPassword';
  FocusNode? focusNode;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool selecteingEmail = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              right: -80, top: -80, child: CustomCircleContainer()),
          const Positioned(
              left: -180, bottom: -180, child: CustomCircleContainer()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        )),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forget the password?',
                      style: TextStyle(
                          fontSize: 23,
                          color: Color(0xff223A6A),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xffe7e7e7),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selecteingEmail = true;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: (selecteingEmail
                                            ? Colors.white
                                            : Colors.transparent)),
                                    child: const Text(
                                      'E-mail',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selecteingEmail = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 3),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: (selecteingEmail
                                                ? Colors.transparent
                                                : Colors.white)),
                                        child: const Text(
                                          'Phone',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(selecteingEmail
                          ? Icons.email_outlined
                          : Icons.call_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 35),
                  child: Row(
                    children: [
                      const Text(
                        'Didn\'t receive verfication?',
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                            child: const Text(
                          'Resend',
                          style: TextStyle(color: kPrimaryColor),
                        )),
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                CustomButton(
                  text: 'Reset the password',
                  color: kPrimaryColor,
                  onTap: () {
                    Navigator.pushNamed(
                        context, const EnterVerficationCode().id);
                  },
                ),
                const Spacer(flex: 3)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
