import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/contact_crud/contact_service.dart';
import 'package:contact_book_app/features/contact_crud/contact_model.dart';
import 'package:flutter/material.dart';

class ContactServiceImpl  implements ContactService {
  

  late FirebaseFirestore db;
  final CollectionReference contacts = 
  FirebaseFirestore.instance.collection('contactsOficial');


  @override
  Future<void> createContact(ContactModel contactModel) {
   return contacts.add({
    'name':contactModel.name,
    'email': contactModel.email,
    'phone': contactModel.phone,
    'objectId': contactModel.objectId,
    'favorite': contactModel.favorite
   });
  }
  
  @override
  Future<void> deleteContact(Long id) {
       throw UnimplementedError();
  }
  
  @override
  Future<QuerySnapshot> getContact() async {
    var contatcs =  await contacts.get();
    return contatcs;

}
  
  @override
  Future<ContactModel> updateContact(ContactModel contactModel) {
    throw UnimplementedError();
  }
   
}
