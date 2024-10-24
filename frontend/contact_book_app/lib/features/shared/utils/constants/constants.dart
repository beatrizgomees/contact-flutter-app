import 'package:cloud_firestore/cloud_firestore.dart';

class Constants{

  static CollectionReference contacts = 
  FirebaseFirestore.instance.collection('contatos');
}