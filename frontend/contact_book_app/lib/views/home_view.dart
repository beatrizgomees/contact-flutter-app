import 'package:contact_book_app/components/card_contact_component.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/viewmodel/home_view_model.dart';
import 'package:contact_book_app/views/create_contact_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel homeViewModel = HomeViewModel();
  XFile? photo;

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchContacts();
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:  FloatingActionButton.extended(onPressed: () {
          Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  const CreateContactView(),
        ),
      );
        }, label: Text('Add Contact', 
            style: AppTheme.darkFontStyleContatcSubtitle),
            backgroundColor: Colors.blue.shade700,
            icon: const Icon(Icons.add_call, color: Colors.white),
            ),
        backgroundColor: AppTheme.backgroundPrincipalColor,
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
          return SingleChildScrollView(
            child: FutureBuilder(
              future: viewModel.fetchContacts(),
              builder: (context, snapshot) {
             return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.contacts.length,
                itemBuilder: (context, index) {
                   var contact = viewModel.contactOrder[index];
                      return CardContactComponent(
                        email: contact.email!, 
                        name: contact.name!,
                        );
                          },
                        );
                      }
                    )
                  );
                }
              )
                )
              );
            }
          }

