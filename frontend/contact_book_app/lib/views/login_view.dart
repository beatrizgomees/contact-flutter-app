import 'package:contact_book_app/components/button_transparent_component.dart';
import 'package:contact_book_app/components/text_form_field_component.dart';
import 'package:contact_book_app/service/auth_service_impl.dart';
import 'package:contact_book_app/viewmodel/login_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar:  _buildTopSectionLoginView(context),
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
              child: _buildLoginButton(context, viewModel)
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

_buildLoginButton(BuildContext context, LoginViewModel viewModel){
  return GestureDetector(
    onTap: () async {
     await viewModel.signInWithEmailAndPassword();
    },
    child: Container(
    height: 60,
    width: MediaQuery.of(context).size.width ,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50)
    ),
    child: const Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Login Now!", style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
          ),
          Icon(Icons.arrow_forward, color: Colors.white, size: 25)
        ],
      ),
    ),
    ),
  );
}

_buildTopSectionLoginView(BuildContext context){
  return AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: MediaQuery.of(context).size.height / 4,
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text("Login",   
                style: TextStyle(
                  fontSize: 35, 
                  color: Colors.white,
                  ),
                ),
                Text(" Account", 
                style: TextStyle(
                  fontSize: 35, 
                  fontStyle: FontStyle.italic, 
                  color: Colors.white,
                  ),
                ),
               
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                
              },
              child: ButtonTransparentComponent(
                height: 35,
                width: 200,
                border: 50,
                colorBorder: Colors.white,
                colortitle: Colors.white,
                title: "Haven't account yet?",
                icon: Icons.arrow_forward,
                iconSize: 20,
                colorIcon: Colors.white,
                sizeTitle: 16,

                ),
            )
          ],
        ),
      );
}

_buildSignWithExternalAccount({
required BuildContext context,  
required String pathImage,  
required double heightImage,  
required double widthImage, 
required String title,  
required Color colorName}){

  return GestureDetector(
    onTap: () {},
    child: Container(
        height: 40,
        width: 150,
        decoration:  BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
    
        ),
        child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pathImage, 
            height: heightImage, 
            width: widthImage),
            Text(title, 
            style: TextStyle(
              color: colorName,
              fontWeight: FontWeight.bold
              ),
              ),
          ],
        ),
        ),
      ),
  );
}



