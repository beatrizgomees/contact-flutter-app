import 'package:cloud_firestore/cloud_firestore.dart';

class Constants{

  static CollectionReference user = 
  FirebaseFirestore.instance.collection('users');


  static final headers = {
    "Content-Type": "application/json",
  };
  static String conectionBackendURL = 'http://10.0.2.2:8080/api/v1/';
}