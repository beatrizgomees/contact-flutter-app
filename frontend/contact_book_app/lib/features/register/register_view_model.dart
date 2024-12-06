import 'package:contact_book_app/domain/model/user_model.dart';
import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/features/contact/model/contact_model.dart';
import 'package:contact_book_app/features/contact/service/contact_service_impl.dart';
import 'package:contact_book_app/features/register/register_service_impl.dart';
import 'package:contact_book_app/features/shared/utils/navigators/navigator_to.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterViewModel extends ChangeNotifier{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String? errorMessage = '';
  AuthServiceImpl authServiceImpl = AuthServiceImpl();
  RegisterServiceImpl registerServiceImpl = RegisterServiceImpl();
  ContactServiceImpl contactServiceImpl = ContactServiceImpl();

  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
   
  
    try {
      await authServiceImpl.createUserWithEmailAndPassword(
      contact: ContactModel(
        email: emailController.text,
        password: passwordController.text
      )
      );

      ContactModel contact = ContactModel(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
    );

    contactServiceImpl.createContactFirebase(contact);
    contactServiceImpl.createContactBackend(contact);
    

    notifyListeners();
    
    NavigateToHome(context);
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      notifyListeners();
    }
  }


  void NavigateToHome(BuildContext context){
     navigateTo(context, "/login");
  }
}