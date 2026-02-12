import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  final FlutterLocalNotificationsPlugin _notificationsPlugin = 
      FlutterLocalNotificationsPlugin();

  Future<void> initilize() async {

      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings("pictures/icon");

          const DarwinInitializationSettings iosSettings = DarwinInitializationSettings{
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          };

          const InitializationSettings initializationSettings =
              InitializationSettings(android: androidSettings, iOS: iosSettings);

              await _notificationsPlugin.initilize(initializationSettings);
  }


  Future<void> showNotification({
    int id = 0,
      String title = " Notification",
      String body = "This is a notification message",
  })async{

    const AndroidNotificationDetails androidNotificationDetails = 
        AndroidNotificationDetails(
          "default_channel",
          "Default Channel",
          channelDescription: "This is a default notification channel",
          priority: Priority.high,
          showWhen: true,
        );

    const DarwinNotificationDetails iosNotificationDetails = 
      DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }


  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }


  Future<void> cancelAllNotification() async {
    await _notificationsPlugin.cancelAll();
  }
}
