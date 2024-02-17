import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset('assets/images/PNG/unsplash_279xIHymPYY.png'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 16, left: 16, top: 16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: lightGrey,
                  ),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur ,Lorem ipsum dolor sit amet.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16, bottom: 8),
                  child: Text(
                    '4:45 AM', // Replace with your time
                    style: TextStyle(color:lightGrey, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key});

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
        child: const Text(
          'Lorem ipsum dolor sit amet, consectetur ,Lorem ipsum dolor sit amet, consectetur',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
