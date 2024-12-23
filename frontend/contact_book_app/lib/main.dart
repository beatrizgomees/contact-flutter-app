import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/features/notifications/notifications_service.dart';
import 'package:contact_book_app/features/contact_crud/create_view_model.dart';
import 'package:contact_book_app/features/home/home_view_model.dart';
import 'package:contact_book_app/features/auth/login_view_model.dart';
import 'package:contact_book_app/features/notifications/notifications_view.dart';
import 'package:contact_book_app/features/contact_crud/create_contact_view.dart';
import 'package:contact_book_app/features/home/home_view.dart';
import 'package:contact_book_app/features/auth/login_view.dart';
import 'package:contact_book_app/features/profile/profile_view_model.dart';
import 'package:contact_book_app/features/register/register_view.dart';
import 'package:contact_book_app/features/register/register_view_model.dart';
import 'package:contact_book_app/features/shared/ui/widgets/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationsService notificationsService = NotificationsService();
  await notificationsService.init();
  await NotificationsService.localNotificationsInit();
  NotificationsService.onMessageOpenedApp();


  //to handle foreground notifications
  NotificationsService.receivedNotificationMessageOnForeground();
  

  //for handling in terrminated state
  final RemoteMessage? message = 
  await FirebaseMessaging.instance.getInitialMessage();

  if(message != null){
    print("Launched from terminated state");
    Future.delayed(const Duration(seconds: 1), (){
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
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CreateViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel())
      ],
      child: MaterialApp(
        //initialRoute: '/home',
        navigatorKey: navigatorKey,
         routes: {
          '/login': (context) => const LoginView(),
          '/home': (context) => const HomeView(),
          '/create': (context) =>  CreateContactView(),
          '/notifications': (context) => const Notificationspage(),
          '/register': (context) => const RegisterView()
          },
        
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: NavigationBottomBar()),
    );
  }
}
