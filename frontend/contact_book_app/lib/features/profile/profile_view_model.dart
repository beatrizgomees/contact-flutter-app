import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/features/shared/utils/navigators/navigator_to.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier{

  AuthServiceImpl authServiceImpl = AuthServiceImpl();


void logout(BuildContext context) {
  
  authServiceImpl.signOut();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
  if (user == null) {
    navigateTo(context, '/login');
    print("Usuário desconectado}");
  } else {
    print("Usuário conectado: ${user.email}");
  }
});
}
}