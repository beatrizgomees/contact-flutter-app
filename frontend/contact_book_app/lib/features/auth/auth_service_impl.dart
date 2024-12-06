import 'package:contact_book_app/features/auth/auth_service.dart';
import 'package:contact_book_app/features/contact/model/contact_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceImpl implements AuthService{
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password,
      
    );

  }
  
  @override
  Future<void> createUserWithEmailAndPassword({
    required ContactModel contact
    
    }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: contact.email!, 
      password: contact.password!,
    );
  }
  
  @override
  Future<void> signOut() async {
   await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
  var user = FirebaseAuth.instance.currentUser;
  return user != null;
  }

  
}