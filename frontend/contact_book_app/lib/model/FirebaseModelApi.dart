/*

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class FirebaseModelApi{


final _firebaseMessaging = FirebaseMessaging.instance;

Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }


void handleMessage(RemoteMessage? message){
  if(message == null) return;
  //Navigator.pushNamed(context, '/notifications', arguments: message);
}

Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    /*

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage(message))
  
  */
  }

 
}


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Titlte: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}
}

}
*/