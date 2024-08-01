import 'dart:convert';

import 'package:contact_book_app/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationsService{
  static final _firebaseMessaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  final fCMToken = await _firebaseMessaging.getToken();
  print('Token: $fCMToken');
}

static void onMessageOpenedApp(){
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
    if(message.notification != null){
      print("Background Notification Tapped");
      navigatorKey.currentState!.pushNamed('/notifications', arguments: message);
    }
  });
}

static void receivedNotificationMessageOnForeground(){
  FirebaseMessaging.onMessage.listen((RemoteMessage message){
    String payloadData = jsonEncode(message.data);
    print("Got a messafe in foreground");
    if(message.notification != null){
      NotificationsService.showSimpleNotification(
        title: message.notification!.title!, 
        body: message.notification!.body!, 
        payload: payloadData);
    }
  });
}

Future firebaseBackgroundMessage(RemoteMessage message) async {
  if(message.notification != null){
    print("Some notification received in background...");
  }
}

static Future localNotificationsInit() async {

   const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);

    // request notification permissions for android 13 or above
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  
}

//on tap local notification in foreground
static void onNotificationTap(NotificationResponse notificationResponse){
  navigatorKey.currentState!
  .pushNamed('/notifications', arguments: notificationResponse);

}

//show a simple notification

static Future showSimpleNotification({
  required String title,
  required String body,
  required String payload,
}) async {
   const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
}

  
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Titlte: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}