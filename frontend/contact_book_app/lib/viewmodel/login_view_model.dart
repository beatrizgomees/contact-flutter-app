import 'package:contact_book_app/service/auth_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage = '';

  AuthServiceImpl authServiceImpl = AuthServiceImpl();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await authServiceImpl.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
        
        );
       
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      print(errorMessage);
       print(emailController.text);
        print(passwordController.text);
      notifyListeners();
    }
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