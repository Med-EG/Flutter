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
      child: WillPopScope(
         onWillPop: () async {
        return await _showExitConfirmationDialog(context);
      },
        child: Scaffold(  
          body: Center(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  const Text(
                    'Message',
                    style: TextStyle(
                        color: darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return const MessageListTile();
                    }),
                  )
                ])),
          ),
        ),
      ),
    );
  }
}
 Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Are you sure you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
