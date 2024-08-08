import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/utils/navigators/navigator_to.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage = '';

  AuthServiceImpl authServiceImpl = AuthServiceImpl();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await authServiceImpl.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
        );

      NavigateToHome(context);
       
       
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      print(errorMessage);
       print(emailController.text);
        print(passwordController.text);
      notifyListeners();
    }
  }

  void NavigateToHome(BuildContext context){
     navigateTo(context, "/home");
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await authServiceImpl.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );

    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      notifyListeners();
    }
  }

  Widget _title(){
    return Text("Firebase");
  }

  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Humm? $errorMessage');
  }

}