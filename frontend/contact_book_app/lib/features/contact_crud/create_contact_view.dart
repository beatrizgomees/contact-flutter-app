import 'package:contact_book_app/features/contact_crud/model/contact_model.dart';
import 'package:contact_book_app/ui/commum_components/text_form_field_component.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/features/contact_crud/create_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateContactView extends StatefulWidget {
   CreateContactView({super.key});

  @override
  State<CreateContactView> createState() => _CreateContactViewState();
}

class _CreateContactViewState extends State<CreateContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppTheme.backgroundPrincipalColor),
        body: ChangeNotifierProvider(
            create: (context) => CreateViewModel(),
        child: Consumer<CreateViewModel>(
          builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
              Divider(),

              const SizedBox(height: 50),
              Text("Add new Contact", style: AppTheme.titleWhiteFont,),
              const SizedBox(height: 50),
                    
                      
              TextFormFieldComponent(
                key: const Key('name_key'),
                keyboardType: TextInputType.name,
                label: "Name",
                controllerText: viewModel.nameController,
                value: viewModel.nameController.text,
                icon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),
                    
              TextFormFieldComponent(
                key: const Key("phone_key"),
                label: "Phone Number", 
                keyboardType: TextInputType.phone, 
                controllerText: viewModel.phoneController, 
                icon: const Icon(Icons.phone_android_outlined), 
                value: viewModel.phoneController.text,
                ),
               const SizedBox(height: 20),
            
              TextFormFieldComponent(
                  key: const Key('email_key'),
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  controllerText: viewModel.emailController,
                  value: viewModel.emailController.text,
                  icon: const Icon(Icons.email),
                ),
                 
            
            const SizedBox(height: 50),
             ElevatedButton.icon(
                  onPressed: () {
                     ContactModel contactModel = ContactModel(
                      name: viewModel.nameController.text,
                      phone: viewModel.phoneController.text,
                      email: viewModel.emailController.text,
                      favorite: false,
                      );
                    viewModel.handleCreate(contactModel, context);
          
                    viewModel.updateListContact();
                  },
                  label: const Text("Create", style: TextStyle(color: Colors.black),),
                  icon: const Icon(Icons.create_rounded, color: Colors.black,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.detailsColor, 
                     
                    ),
                  ),
                ],
              ),
          );
          },
        ),
      ),
    );
  }
}


