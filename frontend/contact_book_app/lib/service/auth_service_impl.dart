import 'package:contact_book_app/interfaces/auth_service.dart';
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
  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password,
    );
  }
  
  @override
  Future<void> signOut() async {
   await _firebaseAuth.signOut();
  }

  
}