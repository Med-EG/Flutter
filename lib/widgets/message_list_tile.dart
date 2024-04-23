import 'package:flutter/material.dart';
import 'package:med_eg/Views/chat_screen.dart';
import '../constants/colors.dart';

class MessageListTile extends StatelessWidget {
  const MessageListTile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: lightGrey, width: 1)
        )
      ),
      child: ListTile(
        leading: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/images/PNG/Dr.png',
        height: 50,
        width: 50,
        fit: BoxFit.cover,),
        ),
        title: const Text(
          'Dr.Mohamed Essa',
          style: TextStyle(
              color: darkBlue, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onTap: () => Navigator.pushNamed(context, const ChatScreen().id),
        trailing: const Text('10:30 PM',style: TextStyle(color: lightGrey, fontWeight: FontWeight.w500, fontSize: 12),),
        subtitle: const Text(
          'Lorem ipsum dolor sit amet, consectetur ,Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet',
          style: TextStyle(
              fontSize: 12, color: lightGrey, fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
