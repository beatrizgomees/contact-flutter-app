import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactServiceImpl  extends ChangeNotifier {
  

  late FirebaseFirestore db;

  final CollectionReference contacts = 
  FirebaseFirestore.instance.collection('contactsOficial');


 
  Future<void> createContact(ContactModel contactModel) {
   return contacts.add({
    'name':contactModel.name,
    'email': contactModel.email,
    'phone': contactModel.phone,
    'objectId': contactModel.objectId,
    'favorite': contactModel.favorite
   });
  }
  
 
  Future<void> deleteContact(Long id) {
       throw UnimplementedError();
  }
  
 
  Future<QuerySnapshot> getContact() async {
    var contatcs =  await contacts.get();
    notifyListeners();
    return contatcs;

}
  
 
  Future<ContactModel> updateContact(ContactModel contactModel) {
    throw UnimplementedError();
  }
   
}
