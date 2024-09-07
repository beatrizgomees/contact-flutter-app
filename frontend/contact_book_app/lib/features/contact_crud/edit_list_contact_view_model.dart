import 'package:contact_book_app/features/contact_crud/model/contact_model.dart';
import 'package:contact_book_app/features/contact_crud/service/contact_service_impl.dart';
import 'package:flutter/material.dart';

class EditListContactViewModel extends ChangeNotifier{

var contactService = ContactServiceImpl();
List<ContactModel> contacts = [];

Future<List<ContactModel>> fetchContacts() async {
  try{
     var contact = await contactService.getContact();
        contacts = contact.docs.map((doc) => ContactModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
        notifyListeners();
    }catch (e){
      print('Erro ao buscar contatos: $e ');
    }
    return contacts;

}

}