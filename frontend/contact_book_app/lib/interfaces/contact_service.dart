import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/model/contact_model.dart';

abstract class ContactService {
  Future<QuerySnapshot> getContact();
  Future<void> createContact(ContactModel contactModel);
  Future<void> deleteContact(Long id);
  Future<ContactModel> updateContact(ContactModel contactModel);
}
