import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/domain/model/contact_model.dart';
import 'package:contact_book_app/domain/service/contact_service_impl.dart';
import 'package:contact_book_app/domain/service/image_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeViewModel extends ChangeNotifier{

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();

var imageService = ImageService();
var contactService = ContactServiceImpl();
XFile? photo;
List<ContactModel> contacts = [];
List<ContactModel> contactOrder = [];
List<ContactModel> contactsFavorites = [];
List<ContactModel> contactsArchives = [];
List<ContactModel> showContactsArchives = [];
bool showOnlyFavorites = false;
bool showOnlyArchives = false;
bool showOnlyGroups = false;
bool showAll = true;



//Get dos contatos do banco
Future<List<ContactModel>> fetchContacts() async {

  try{
    if(showAll == true){
     var contact = await contactService.getContact();
        contacts = contact.docs.map((doc) => ContactModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
        notifyListeners();
      }
    }catch (e){
      print('Erro ao buscar contatos: $e ');
    }
    return contacts;

}


//Ordenação da lista por ordem alfabetica
List<ContactModel> orderList(List<ContactModel> contactList){
  List<ContactModel> order = contactList.toList();
  order.sort((a,b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
  for (var contact in order) {
    contactOrder.add(contact);
    notifyListeners();
  }
  notifyListeners();
 
  return order;
}


//Atualização do estado de favorito
Future<void> updateFavorite(String? objectId, bool favorite) async{
    try{
     DocumentReference documentRef = FirebaseFirestore.instance
        .collection('contatos')
        .doc(objectId);

      Map<String, dynamic> updatedData = {
          'favorite': favorite,
        };

      await documentRef.update(updatedData);

    print('Document updated successfully!'); //criar um snackbar
  } catch (e) {
    print('Error updating document: $e');
  }
  
  
}

void toggleFavorite(){
  if(showOnlyFavorites == true){
    getFavoritesContacts();
  }

}

void toggleArchives(){
  if(showOnlyArchives == true){
    getArchivesContacts();
  }

}


//Utilizando a lista já preenchida com os contatos no
//primeiro get, criamos uma nova lista verificando se o 
//atributo favorite é igual a verdadeiro
Future<void> getFavoritesContacts() async {
contactsFavorites.clear();
for (var element in contacts) {
  if(element.favorite == true){
    contactsFavorites.add(element);
  }
}
notifyListeners();

 
}

Future<void> getArchivesContacts() async {
showContactsArchives.clear();
for(var element in contacts){
  if(element.archive == true){
    showContactsArchives.add(element);
  }
}
  notifyListeners();
}


Future<void> addArchivesContactsList(bool isArchive, ContactModel contact, List<ContactModel> displayedContacts) async {
  // Lista temporária para armazenar contatos a serem removidos
  List<ContactModel> contactsToRemove = [];


  if(isArchive){
  contactsArchives.add(contact);  // Adiciona ao arquivo
  contact.archive = isArchive;
  }
  // Atualiza os dados
  showContactsArchives.clear();
  showContactsArchives.addAll(contactsArchives);
 
  
  // Notifica os listeners após as mudanças
  notifyListeners();

}







}