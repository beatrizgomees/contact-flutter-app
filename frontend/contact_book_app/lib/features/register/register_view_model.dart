import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/features/shared/model/contact_model.dart';
import 'package:contact_book_app/features/shared/service/contact_service_impl.dart';
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
  ContactServiceImpl contactServiceImpl = ContactServiceImpl();

  //Função para realizar o login utilizando credenciais
  Future<void> createUserWithEmailAndPassword(BuildContext context) async {
    try {
      await authServiceImpl.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );

      ContactModel contactModel = ContactModel(
      email: emailController.text,
      phone: int.parse(phoneController.text),
      name: nameController.text,
      
     );

    contactServiceImpl.createContact(contactModel);
    notifyListeners();


    NavigateToHome(context);
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      notifyListeners();
    }
  }

  // ignore: non_constant_identifier_names
  void NavigateToHome(BuildContext context){
     navigateTo(context, "/login");
  }
}