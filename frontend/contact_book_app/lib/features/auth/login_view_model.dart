import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/features/auth/model/user_model.dart';
import 'package:contact_book_app/features/shared/ui/widgets/navigation_bar.dart';
import 'package:contact_book_app/features/shared/utils/navigators/navigator_to.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorMessage = '';

  AuthServiceImpl authServiceImpl = AuthServiceImpl();

// Fazer login com essas credenciais
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await authServiceImpl.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
        );


      String? token = authServiceImpl.getFirebaseToken().toString();
      NavigateToHome(context);

      UserModel user = UserModel(email: emailController.text, password: passwordController.text, token: token);
      authServiceImpl.sendUserToBack(user);
       
       
    } on FirebaseAuthException catch (e){
      errorMessage = e.message;
      notifyListeners();
    }
  }

  void NavigateToHome(BuildContext context){
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => NavigationBottomBar()),
  );
  }

  Widget _title(){
    return Text("Firebase");
  }

  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Humm? $errorMessage');
  }

}