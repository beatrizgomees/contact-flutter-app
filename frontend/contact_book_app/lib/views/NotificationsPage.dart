import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificationspage extends StatefulWidget {
  const Notificationspage({super.key});

  @override
  State<Notificationspage> createState() => _NotificationspageState();
}

class _NotificationspageState extends State<Notificationspage> {

  Map payload = {};

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)!.settings.arguments;

    //for background and terminated state
    if(data is RemoteMessage){
      payload = data.data;
    }
    
    if(data is NotificationResponse){
      payload = jsonDecode(data.payload!);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Message"),

      
      ),
      body: Center(child: Text(payload.toString()),),
    ) ;
  }
}