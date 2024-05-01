import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class Test extends StatelessWidget {
  const Test({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () async {
            // Show loading indicator
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );

            // Request permission to send notifications if not granted
            bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
            if (!isAllowed) {
              await AwesomeNotifications().requestPermissionToSendNotifications();
            }

            // Example time in HH:MM format (replace with your desired time)
            String timeString = '12:54';

            // Parse the time string to obtain the hour and minute values
            List<String> parts = timeString.split(':');
            int hour = int.parse(parts[0]);
            int minute = int.parse(parts[1]);

            // Create a DateTime object for today with the specified time
            DateTime now = DateTime.now();
            DateTime scheduledDateTime = DateTime(now.year, now.month, now.day, hour, minute);

            // Set the appropriate time zone for your notifications
            String timeZone = 'Africa/Cairo'; // Use 'Africa/Cairo' for Cairo time zone

            // Schedule the notification to be sent every day at the specified time
            await AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 1,
                channelKey: 'basic_channel',
                title: 'Hello there',
                body: "This is the body of the message",
              ),
              schedule: NotificationCalendar(
                timeZone: timeZone,
                hour: scheduledDateTime.hour,
                minute: scheduledDateTime.minute,
                second: 0,
                allowWhileIdle: true,
                repeats: true,
              ),
            );

            // Close loading indicator
            Navigator.of(context).pop();
          },
          child: Icon(Icons.notifications),
        ),
      ),
    );
  }
}
