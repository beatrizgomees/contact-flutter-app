import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/shared/service/contact_service.dart';
import 'package:contact_book_app/features/shared/model/contact_model.dart';
import 'package:contact_book_app/features/shared/utils/constants/constants.dart';

class ContactServiceImpl  implements ContactService {
  

  var contacts = Constants.contacts;


  //Create
  @override
  Future<void> createContact(ContactModel contactModel) async {
    final DocumentReference docRef = await contacts.add({
    'name':contactModel.name,
    'email': contactModel.email,
    'phone': contactModel.phone,
    'objectId': contactModel.objectId,
    'favorite': contactModel.favorite
   });

   final String id = docRef.id; //Atribuição do valor do id 
   contacts.doc(id).update({'objectId': id});


  }
  
  @override
  Future<void> deleteContact(Long id) {
       throw UnimplementedError();
  }
  
  //Read
  @override
  Future<QuerySnapshot> getContact() async {
    var contatcs =  await contacts.get();
    return contatcs;

}
  
  @override
  Future<void> updateContact(ContactModel contactModel) async {
    
  
  }
   
}
