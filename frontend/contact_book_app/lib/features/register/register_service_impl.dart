import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/auth/model/user_model.dart';
import 'package:contact_book_app/features/contact/model/contact_model.dart';
import 'package:contact_book_app/features/register/register_service.dart';
import 'package:contact_book_app/features/shared/utils/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterServiceImpl implements RegisterService{

  var users = Constants.user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> createUserWithEmailAndPassword({
    required ContactModel contact
    
    }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: contact.email!, 
      password: contact.password!,
    );
  }
}