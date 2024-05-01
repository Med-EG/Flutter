import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/chat_bubble.dart';
import 'package:med_eg/widgets/custom_textFormField.dart';
import '../widgets/custom_arrow_back.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
final String id = 'chatScreen';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomArrowBack(),
                SizedBox(
                  width: screenWidth * 0.125,
                ),
                const Text(
                  'Dr.Mohamed Essa',
                  style: TextStyle(
                      color: darkBlue, fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return const ChatBubbleForFriend();
              }),
            ),
            const CustomTextFormField(label: 'type message here...')
          ]),
        ),
      ),
    );
  }
}