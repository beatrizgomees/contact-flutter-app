import 'package:contact_book_app/service/contact_service_impl.dart';
import 'package:contact_book_app/service/notifications_service.dart';
import 'package:contact_book_app/viewmodel/create_view_model.dart';
import 'package:contact_book_app/viewmodel/home_view_model.dart';
import 'package:contact_book_app/views/NotificationsPage.dart';
import 'package:contact_book_app/views/create_contact_view.dart';
import 'package:contact_book_app/views/home_view.dart';
import 'package:contact_book_app/views/login_view.dart';
import 'package:contact_book_app/views/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationsService.init();
  await NotificationsService.localNotificationsInit();
  NotificationsService.onMessageOpenedApp();

  //to handle foreground notifications
  NotificationsService.receivedNotificationMessageOnForeground();
  

  //for handling in terrminated state
  final RemoteMessage? message = 
  await FirebaseMessaging.instance.getInitialMessage();

  if(message != null){
    print("Launched from terminated state");
    Future.delayed(Duration(seconds: 1), (){
      navigatorKey.currentState!.pushNamed("/notifications", arguments: message);
    });
  }

  runApp(  
    MyApp(),
  );
}


final navigatorKey = GlobalKey<NavigatorState>();



class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext mcontext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactServiceImpl()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CreateViewModel())
      ],
      child: MaterialApp(
        //initialRoute: '/home',
        navigatorKey: navigatorKey,
         routes: {
          '/login': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
          '/create': (context) => const CreateContactView(),
          '/notifications': (context) => const Notificationspage()
          },
        
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginView()),
    );
  }
}
