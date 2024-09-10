import 'package:contact_book_app/features/register/register_view_model.dart';
import 'package:contact_book_app/ui/commom/text_form_field_component.dart';
import 'package:contact_book_app/ui/commom/top_section_component.dart';
import 'package:contact_book_app/ui/widgets/button_register_or_login_widget.dart';
import 'package:contact_book_app/ui/widgets/sign_with_external_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopSectionComponent(
        titleSection: "Register", 
        titleButtonLoginOrRegister: "Have an account?",
        routeName: "/login",
        
        ),
      body: SingleChildScrollView(
        child: Consumer<RegisterViewModel>(
          builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                  TextFormFieldComponent(
                  label: "Name", 
                   keyboardType: TextInputType.name,
                  controllerText: viewModel.nameController, 
                  value: viewModel.nameController.text,
               
                  ),
        
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                  label: "Email Address", 
                   keyboardType: TextInputType.emailAddress,
                  controllerText: viewModel.emailController, 
                  value: viewModel.emailController.text,
               
                  ),
        
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                  label: "Phone", 
                   keyboardType: TextInputType.phone,
                  controllerText: viewModel.phoneController, 
                  value: viewModel.phoneController.text,
               
                  ),
        
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                  label: "Password", 
                   keyboardType: TextInputType.emailAddress,
                  controllerText: viewModel.passwordController, 
                  value: viewModel.passwordController.text,
                  isObscureText: true,
                  ),
        
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                  label: "Confirm Password", 
                   keyboardType: TextInputType.emailAddress,
                  controllerText: viewModel.confirmController, 
                  value: viewModel.confirmController.text,
                  isObscureText: true,
                  ),
        
                  const SizedBox(height: 20),
                  ButtonRegisterOrLoginWidget(
                    viewModel: viewModel, 
                    labelButton: "Register Now!",
                    onTap: () async {
                      await viewModel.createUserWithEmailAndPassword(context);
                    },
                  ),
        
        
                const SizedBox(height: 20),
                const Text("Or Continue with", style: TextStyle(
                fontWeight: FontWeight.bold),
                ),
        
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignWithExternalAccountWidget(
                    colorName: Colors.red,
                    title: "Google",
                    pathImage: 'assets/images/iconGoogle.png',
                    heightImage: 30,
                    widthImage: 20,
                  ),
        
                    const SizedBox(width: 20),
                    SignWithExternalAccountWidget(
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
        ),
      ),
    );
  }
}