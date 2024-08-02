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
    return Scaffold(
      
      appBar: _buildTopSectionHomeView(context),
      floatingActionButton: _buildFloatButtonCreateContact(context),
    
      backgroundColor: AppTheme.backgroundPrincipalColor,
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
        return SingleChildScrollView(
          child: _buildListContact(context, viewModel)
                );
              }
            ),   
          );
        }
      }

_buildTopSectionHomeView(BuildContext context){
  return AppBar(
          leadingWidth: 100,
          backgroundColor: AppTheme.backgroundPrincipalColor,
          actions: [
          IconButton(
            icon: const Icon(Icons.notifications), 
            color: Colors.white,
             onPressed: () {
              Navigator.pushNamed(context, '/notifications');
          },
          ),
        ],
        leading: Text(
          "Contacts", 
          style: AppTheme.darkFontStyleContactName,
          ),
        );
}

_buildFloatButtonCreateContact(BuildContext context){
   return FloatingActionButton.extended(
          onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  const CreateContactView(),
                ),
              );
        }, label: Text('Add Contact', 
            style: AppTheme.darkFontStyleContatcSubtitle),
            backgroundColor: Colors.blue.shade700,
            icon: const Icon(Icons.add_call, color: Colors.white),
            );
}

Widget _getData(var snapshot){
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
      child: CircularProgressIndicator(),
    );
    } else if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {

    // Handle errors
      return Center(
      child: Text('Error: ${snapshot.error}'),
    );
    }
  }
  return const Center(
    child: Text('Something went wrong!'),
  );
}

_buildListContact(BuildContext context, HomeViewModel viewModel){
  return FutureBuilder(
  future: Provider.of<HomeViewModel>(context, listen: false).fetchContacts(),
  builder: (context, snapshot) {
  _getData(snapshot);
  return ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: viewModel.contacts.length,
  itemBuilder: (context, index) {
    var contact = viewModel.contacts[index];
      return CardContactComponent(
        email: contact.email!, 
        name: contact.name!,
        );
          },
        );
      }
    );
}