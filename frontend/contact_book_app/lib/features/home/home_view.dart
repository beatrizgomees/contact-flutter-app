import 'package:contact_book_app/features/chat/chat_view.dart';
import 'package:contact_book_app/domain/model/contact_model.dart';
import 'package:contact_book_app/domain/service/search_contacts_service.dart';
import 'package:contact_book_app/features/home/search_contact_list_view.dart';
import 'package:contact_book_app/features/shared/ui/commom/card_contact_component.dart';
import 'package:contact_book_app/features/shared/ui/widgets/dimissible_button_widget.dart';
import 'package:contact_book_app/features/shared/ui/widgets/filter_button_widget.dart';
import 'package:contact_book_app/features/home/home_view_model.dart';
import 'package:contact_book_app/features/shared/ui/widgets/navigation_bar.dart';
import 'package:contact_book_app/features/shared/utils/themes/AppTheme.dart';
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
      body:SafeArea(
        child: SingleChildScrollView(
             child: _buildListContact(context, viewModel)
               ),
      ), 
      
          );
        }

        
      }

_buildTopSectionHomeView(BuildContext context, HomeViewModel viewModel){
  return AppBar(
    title: const Text("Chats"),
    toolbarHeight: 120,
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
                  viewModel.showOnlyArchives = false;
                  viewModel.fetchContacts(); 
                }
              },
              isAll: viewModel.showAll,
              
              ),
              FilterButton(label: "Favorites", onPressed: () {
              if(!viewModel.showOnlyFavorites){
                viewModel.showAll = false; //Garante que o filtro All seja desativado 
                viewModel.showOnlyFavorites = true; //Ativa o filtro favorites
                viewModel.showOnlyArchives = false;
                viewModel.toggleFavorite();
              }
              },
              isFavorite: viewModel.showOnlyFavorites,
            ), 
            
            FilterButton(label: "Archives", onPressed: () {
              if(!viewModel.showOnlyArchives){
                viewModel.showAll = false; //Garante que o filtro All seja desativado 
                viewModel.showOnlyArchives = true; //Ativa o filtro favorites
                viewModel.showOnlyFavorites = false;
                viewModel.toggleArchives();
              }
              },
              isArchives: viewModel.showOnlyArchives,
            ),
              
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
    if(viewModel.showOnlyArchives){
      displayedContacts = viewModel.contactsArchives;
    }
    return displayedContacts;
}

_buildListContact(BuildContext context, HomeViewModel viewModel){
  final ScrollController scrollController = ScrollController();
  bool isArchive = false;

  return FutureBuilder(
    future: Provider.of<HomeViewModel>(context, listen: false).fetchContacts(),
    builder: (context, snapshot) {

    _connectionState(snapshot);
    List<ContactModel> displayedContacts = buildListsWithFilters(viewModel, snapshot);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
      controller: scrollController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: displayedContacts.length,
      itemBuilder: (context, index) {
        var contact = displayedContacts[index];
          return GestureDetector(
            child: CardContactComponent(
            contactModel: contact,
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

