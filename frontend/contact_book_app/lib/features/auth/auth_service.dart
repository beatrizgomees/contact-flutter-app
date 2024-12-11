import 'package:contact_book_app/features/contact/model/contact_model.dart';

abstract class AuthService{

  Future<void> signInWithEmailAndPassword({required String email, required String password});
  Future<void> createUserWithEmailAndPassword({required ContactModel contact});
  Future<void> signOut();
  Future<bool> isLoggedIn();
}