import 'package:contact_book_app/features/shared/ui/commom/button_transparent_component.dart';
import 'package:contact_book_app/features/shared/ui/commom/text_form_field_component.dart';
import 'package:contact_book_app/features/auth/auth_service_impl.dart';
import 'package:contact_book_app/features/auth/login_view_model.dart';
import 'package:contact_book_app/features/shared/ui/commom/top_section_component.dart';
import 'package:contact_book_app/features/shared/ui/widgets/button_register_or_login_widget.dart';
import 'package:contact_book_app/features/shared/ui/widgets/sign_with_external_account_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  final User? user = AuthServiceImpl().currentUser;




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: TopSectionComponent(
        titleSection: "Login", 
        titleButtonLoginOrRegister: "Haven't account yet?",
        routeName: "/register",
        ),
      body: SingleChildScrollView(
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, _) {
          return _buildBodySectionLoginView(
            viewModel: viewModel, 
            context: context,
            );
          }
        ),
      ),
    
    );
  }
}

_buildBodySectionLoginView({
  required LoginViewModel viewModel,
  required BuildContext context}){
    return Padding(
      padding: const EdgeInsets.all(20),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
       
          TextFormFieldComponent(
            label: "Email Address", 
             keyboardType: TextInputType.emailAddress,
            controllerText: viewModel.emailController, 
            value: viewModel.emailController.text,
         
            ),
            const SizedBox(height: 20),
            TextFormFieldComponent(
            label: "Password", 
             keyboardType: TextInputType.emailAddress,
            controllerText: viewModel.passwordController, 
            value: viewModel.passwordController.text,
            isObscureText: true,
            ),
    
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: ButtonRegisterOrLoginWidget(
                viewModel: viewModel, 
                labelButton: "Login Now!",
                onTap: () async {
                 await viewModel.signInWithEmailAndPassword(context);
                },
                ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonTransparentComponent(
                height: 30,
                width: 200,
                border: 50,
                colorBorder: Colors.black,
                colortitle: Colors.black,
                sizeTitle: 13,
                title: "Remember Password",
                icon: Icons.arrow_forward,
                iconSize: 20,
                colorIcon: Colors.white,
                fontWeight: FontWeight.bold,
                ),
            ),
    
            const Text("Or Continue with", style: TextStyle(
              fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSignWithExternalAccount(
                  context: context,
                  colorName: Colors.red,
                  title: "Google",
                  pathImage: 'assets/images/iconGoogle.png',
                  heightImage: 30,
                  widthImage: 20,
                  ),
                const SizedBox(width: 20),
                _buildSignWithExternalAccount(
                  context: context,
                  colorName: Colors.blue.shade900,
                  title: "Facebook",
                  pathImage: 'assets/images/facebook.png',
                  heightImage: 30,
                  widthImage: 20,
                  ),
               
              ],
            )
        ],
      ),
    );
  
}



// Widgets and components LoginView




_buildSignWithExternalAccount({
required BuildContext context,  
required String pathImage,  
required double heightImage,  
required double widthImage, 
required String title,  
required Color colorName}){

  return  SignWithExternalAccountWidget(
  colorName:colorName,
  title: title,
  pathImage: pathImage,
  heightImage: heightImage,
  widthImage: widthImage,
  );
                  
}



