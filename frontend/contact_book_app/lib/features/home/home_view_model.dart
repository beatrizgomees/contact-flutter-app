import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/contact_crud/model/contact_model.dart';
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

takeImage(XFile? photo) async {
 imageService.takeImage(photo);
}




Future<void> fetchContacts() async {
  var contact = await contactService.getContact();

  contacts = contact.docs.map((doc) => 
  ContactModel.fromMap(doc.data() as Map<String, dynamic>)).toList();


 
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
/*
void toggleFavorite(ContactModel contactModel, bool isFavorited){
 if(contactModel.favorite != isFavorited){
  contactModel.favorite = isFavorited;
  notifyListeners();
 }
  
}

*/


Future<void> updateFavorite(ContactModel contactModel) async{
 DocumentReference docRef = await contactService.contacts
    .doc(contactModel.objectId);

  DocumentSnapshot document = await docRef.get();

  if (document.exists) {
    // Atualizando o telefone
    await docRef.update({'favorite': contactModel.favorite});
    print('Favorito atualizado com sucesso! ${contactModel.favorite}');
  } else {
    print('Contato não encontrado.');
  }
}





}