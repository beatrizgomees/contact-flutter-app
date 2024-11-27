import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService{

  Future<void> signInWithEmailAndPassword({required String email, required String password});
  Future<void> createUserWithEmailAndPassword({required String email, required String password});
  Future<void> signOut();
  Future<void> isLoggedIn();
  Future<bool> isLoggedInValue();
  Future<void> initAuth();
}