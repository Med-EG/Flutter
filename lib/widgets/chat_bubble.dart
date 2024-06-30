import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/message model.dart';

class ChatBubbleGrey extends StatelessWidget {
  const ChatBubbleGrey({super.key, required this.messageContent});
final MessageModel messageContent; 
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: lightGrey),
        child:  Text(
          messageContent.content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class ChatBubbleBlue extends StatelessWidget {
  const ChatBubbleBlue({super.key, required this.messageContent});
final MessageModel messageContent; 
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            color: kPrimaryColor),
        child:  Text(
          messageContent.content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}