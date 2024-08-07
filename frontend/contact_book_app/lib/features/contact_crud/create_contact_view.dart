import 'package:contact_book_app/ui/commum_components/text_form_field_component.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/features/contact_crud/create_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateContactView extends StatefulWidget {
  const CreateContactView({super.key});

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
          return SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  minRadius: 50,
                  maxRadius: 100,
                  backgroundColor: Colors.white,
                ),
              const SizedBox(height: 20),
                      
              ElevatedButton(
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                              title: const Text("Camera"),
                              leading: const Icon(Icons.camera),
                              onTap: () async {
                              viewModel.takeImage(null);
                              },),
                          ListTile(
                            title: const Text("Galery"),
                            leading: const Icon(Icons.photo),
                            onTap: () async {
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              child: const Text("Select Image"),
              ),
              const SizedBox(height: 20),
                      
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
                  key: const Key("email_key"),
                  keyboardType: TextInputType.emailAddress,
                  label: "Email",
                  controllerText: viewModel.emailController,
                  value: viewModel.emailController.text,
                  icon: const Icon(Icons.email),
                ),
                 
            
            const SizedBox(height: 50),
             ElevatedButton.icon(
                  onPressed: () {
                    viewModel.actionCreate(context);
                  },
                  label: const Text("Create"),
                  icon: const Icon(Icons.create_rounded),
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


