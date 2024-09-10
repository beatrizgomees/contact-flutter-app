import 'package:contact_book_app/features/contact_crud/edit_list_contact_view_model.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditListContactView extends StatefulWidget {
  const EditListContactView({super.key});

  @override
  State<EditListContactView> createState() => _EditListContactViewState();
}

class _EditListContactViewState extends State<EditListContactView>  {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
      body: SingleChildScrollView(
        child: Consumer<EditListContactViewModel>(
          builder: (context, viewModel, child) {
          return FutureBuilder(
            future: Provider.of<EditListContactViewModel>(context, listen: false).fetchContacts(),
            builder: (context, snapshot) {
              return SizedBox(
                height: 300,
                child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.contacts.length,
                itemBuilder: (context, index) {
                var contact = viewModel.contacts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      children: [
                        const CircleAvatar(),
                        const SizedBox(width: 20),
                        Text(contact.name!, style: const TextStyle(fontSize: 20, color: Colors.white),),
                      ],
                    ),),
                );
                }
                ),
              );
          }
          );
          }
        ),
      ),
    );
  }
}