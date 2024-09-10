import 'package:contact_book_app/features/chat/chat_view.dart';
import 'package:contact_book_app/features/contact_crud/model/contact_model.dart';
import 'package:contact_book_app/features/contact_crud/service/search_contacts_service.dart';
import 'package:contact_book_app/features/home/search_contact_list_view.dart';
import 'package:contact_book_app/ui/commom/card_contact_component.dart';
import 'package:contact_book_app/ui/widgets/filter_button_widget.dart';
import 'package:contact_book_app/features/home/home_view_model.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  XFile? photo;
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchContacts();
    });
   
  }

  @override
  Widget build(BuildContext context) {

    HomeViewModel viewModel = context.watch<HomeViewModel>();
    
    return Scaffold(
      appBar: _buildTopSectionHomeView(context, viewModel),
      backgroundColor: AppTheme.backgroundPrincipalColor,
      body:SingleChildScrollView(
           child: _buildListContact(context, viewModel)
             ), 
        
          );
        }
      }

_buildTopSectionHomeView(BuildContext context, HomeViewModel viewModel){
  return AppBar(
    title: const Text("Chats"),
    toolbarHeight: 150,
    backgroundColor: AppTheme.backgroundPrincipalColor,
    leadingWidth: MediaQuery.of(context).size.width,
    actions: [
     IconButton(
      icon: const Icon(Icons.search, color: Colors.white),
      onPressed: () {
        ContactsList(contact: viewModel.contacts);
        showSearch(
        context: context,
        delegate: SearchContactsService(contacts: viewModel.contacts),
      );
      },
    ),
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
           _buildFiltersButton(context, viewModel)
          ],
        ),
      ),
  );
}

_buildFiltersButton(BuildContext context, HomeViewModel viewModel){
   return Stack(
      children:[
        SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterButton(label: "All", onPressed: () {
                if(!viewModel.showAll){
                  viewModel.showOnlyFavorites = false; // Garante que o filtro de favoritos seja desativado
                  viewModel.showAll = true; // Ativa o filtro "All"
                  viewModel.fetchContacts(); 
                }
              },
              isAll: viewModel.showAll,
              
              ),
              FilterButton(label: "Favorites", onPressed: () {
              if(!viewModel.showOnlyFavorites){
                viewModel.showAll = false;
                viewModel.showOnlyFavorites = true;
                viewModel.toggleFavorite();
              }
              },
              isFavorite: viewModel.showOnlyFavorites,
            ),
              //FilterButton(label: "Groups"),
            ],
          ),
        )

    ],
  );
}

Widget _connectionState(var snapshot){
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


List<ContactModel> buildListsWithFilters(HomeViewModel viewModel, var snapshot){
  List<ContactModel> displayedContacts = [];
   if(viewModel.showOnlyFavorites == true){
      displayedContacts = viewModel.contactsFavorites;
    }else{
     if(viewModel.showAll && snapshot.data != null){
      List<ContactModel> allContacts = snapshot.data!;
      displayedContacts = allContacts;
     }
    }
    return displayedContacts;
}

_buildListContact(BuildContext context, HomeViewModel viewModel){
  return FutureBuilder(
    future: Provider.of<HomeViewModel>(context, listen: false).fetchContacts(),
    builder: (context, snapshot) {

    _connectionState(snapshot);
    List<ContactModel> displayedContacts = buildListsWithFilters(viewModel, snapshot);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedContacts.length,
      itemBuilder: (context, index) {
        var contact = displayedContacts[index];
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
               contactModel: contact,
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
            ),
    );
        }
    );
}