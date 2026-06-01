import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreateMethod(
      ReceivedNotification reciveNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayMethod(
      ReceivedNotification reciveNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onActionReciveMethod(
      ReceivedNotification reciveNotification) async {}

      @pragma("vm:entry-point")
  static Future <void> onDismissActionReciveMethod(ReceivedNotification reciveNotification)async{}
}
