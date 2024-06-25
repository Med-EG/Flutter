import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';
import 'package:med_eg/services/get_all_alertsTimes_for_patient.dart';

class NotificationHelper {
  Map<int, String> timesMap = {};

 
    //  List<MedicineAlertModel> medicinesForPatient= GetAllAlertsService().GetAllAlerts as List<MedicineAlertModel>;
  notificationListCreation(BuildContext context) async {
     List<AlertTimeModelForNotification> times =
        await GetAllALertsTimesService().GetAllLertsTimes(context);
    for (int i = 0; i < times.length; i++) {
      timesMap[times[i].alertTimeID] = times[i].alertTime;
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }

      // Example time in HH:MM format (replace with your desired time)
      String timeString = times[i].alertTime.toString();

      // Parse the time string to obtain the hour and minute values
      List<String> parts = timeString.split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      // Create a DateTime object for today with the specified time
      DateTime now = DateTime.now();
      DateTime scheduledDateTime =
          DateTime(now.year, now.month, now.day, hour, minute);

      // Set the appropriate time zone for your notifications
      String timeZone =
          'Africa/Cairo'; // Use 'Africa/Cairo' for Cairo time zone

      // Schedule the notification to be sent every day at the specified time
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: "It's medicine time !",
          body: "Don't forget you'r ${times[i].medicineName} medicine",
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
    }
  }
}
