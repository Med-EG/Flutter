import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/widgets/message_list_tile.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});
  final String id = 'MessageScreen';

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
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const Text(
                'Message',
                style: TextStyle(
                    color: darkBlue, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              const MessageListTileForPatient(),
            ],
          ),
        ),
      ),
    ));
  }
}

Future<bool> _showExitConfirmationDialog(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}
