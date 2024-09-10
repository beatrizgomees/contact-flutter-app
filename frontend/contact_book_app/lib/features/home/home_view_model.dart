import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/shared/model/contact_model.dart';
import 'package:contact_book_app/features/contact_crud/service/contact_service_impl.dart';
import 'package:contact_book_app/features/contact_crud/service/image_service.dart';
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
bool showOnlyFavorites = false;
bool showOnlyGroups = false;
bool showAll = true;

takeImage(XFile? photo) async {
 imageService.takeImage(photo);
}




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

  contactsFavorites.clear();

}


Future<void> getFavoritesContacts() async {
 
  var contact = await contactService.getContact();
  contacts = contact.docs.map((doc) => ContactModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  
  contacts.forEach((element) {
    if(element.favorite == true){
      contactsFavorites.add(element);
    }
  },);
  notifyListeners();

 
}




}