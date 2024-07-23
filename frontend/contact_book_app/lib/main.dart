import 'package:contact_book_app/viewmodel/create_view_model.dart';
import 'package:contact_book_app/viewmodel/home_view_model.dart';
import 'package:contact_book_app/views/create_contact_view.dart';
import 'package:contact_book_app/views/home_view.dart';
import 'package:contact_book_app/views/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext mcontext) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => CreateViewModel())
      ],
      child: MaterialApp(
        //initialRoute: '/home',
         routes: {
          '/home': (context) => const HomeView(),
          '/create': (context) => const CreateContactView(),
          },
        
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const NavigationBottomBar()),
    );
  }
}
