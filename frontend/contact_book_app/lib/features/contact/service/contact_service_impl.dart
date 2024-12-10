import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/contact/service/contact_service.dart';
import 'package:contact_book_app/features/contact/model/contact_model.dart';
import 'package:contact_book_app/features/shared/utils/constants/constants.dart';
import 'package:gallery_saver/files.dart';

class ContactServiceImpl  implements ContactService {
  

  var contacts = Constants.user;


  //Create
  @override
  Future<void> createContactFirebase(ContactModel contactModel) async {
    final DocumentReference docRef = await contacts.add({
    'name':contactModel.name,
    'email': contactModel.email,
    'phone': contactModel.phone,
    'objectId': contactModel.objectId,
    'favorite': contactModel.favorite,
    'archive': contactModel.archive
   });

   final String id = docRef.id; //Atribuição do valor do id 
   contacts.doc(id).update({'objectId': id});


  }

  @override
  Future<void> createContactBackend(ContactModel contactModel) async {
   
    var response;
    try {

        // Obtenha o token do Firebase
        final token = await getFirebaseToken();
      
        if (token == null) {
          print('Usuário não autenticado');
          return;
        }
        final headers = {
            'authorization': 'Bearer $token',
            'Content-Type': 'application/json',
        };
        
        response = await http.post(
          Uri.parse(Constants.conectionBackendURL),
          headers: headers,
          body: jsonEncode(contactModel.toJson()),
        );
        if (response.statusCode == 201) {
          log(response.body);
        }
      } catch (e) {
        throw Exception('Error: $e, ${response.statusCode}');
      }
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
  
  @override
  Future<String?> getFirebaseToken() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return await user.getIdToken(); // Retorna o token JWT
    }
    return null; // Caso não haja usuário autenticado
  }
  
 
   
}
