import 'package:contact_book_app/features/chat/chat_view.dart';
import 'package:contact_book_app/ui/commum_components/card_contact_component.dart';
import 'package:contact_book_app/ui/widgets/filter_button_widget.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/features/home/home_view_model.dart';
import 'package:contact_book_app/features/contact_crud/create_contact_view.dart';
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
      backgroundColor: Colors.white,
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
    title: const Text("Chats"),
    toolbarHeight: 150,
    backgroundColor: Colors.black,
    leadingWidth: MediaQuery.of(context).size.width,
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.search,  color: Colors.white,))
    ],
    leading:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text("Chats", style: TextStyle(fontSize: 20, color: Colors.white),)),
           IconButton(onPressed: () {}, icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
           ),
            Stack(
              children:[
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FilterButton(label: "All"),
                     FilterButton(label: "Favorites"),
                     FilterButton(label: "Groups"),
                   ],
                 ),
               )

            ],
          ),
           
          ],
        ),
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
            style: AppTheme.whiteFontStyleContactName),
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
        return GestureDetector(

          
          child: Dismissible(
            key: Key(viewModel.contacts[index].toString()),
            background: Container(color: Colors.blue, child: Icon(Icons.archive_outlined, size: 30,),),
            secondaryBackground: Container(color: Colors.red, child: Icon(Icons.delete_outline, size: 30,),),
            onDismissed: (direction) {
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item ${viewModel.contacts[index].toString()} arquivado')),
              );
              
            },
            child: CardContactComponent(
              email: contact.email!, 
              name: contact.name!,
              ),
          ),
            onTap: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatView(contactModel: contact),
                  ),
                );
            },
        );
            },
          );
        }
    );
}