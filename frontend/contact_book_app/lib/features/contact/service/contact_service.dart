import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/contact/model/contact_model.dart';

abstract class ContactService {
  Future<QuerySnapshot> getContact();
  Future<void> createContactFirebase(ContactModel contactModel);
  Future<void> createContactBackend(ContactModel contactModel);
  Future<void> deleteContact(Long id);
  Future<void> updateContact(ContactModel contactModel);
  Future<String?> getFirebaseToken();
}
