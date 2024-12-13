import 'dart:convert';
import 'dart:developer';

import 'package:contact_book_app/features/auth/auth_service.dart';
import 'package:contact_book_app/features/auth/model/user_model.dart';
import 'package:contact_book_app/features/shared/utils/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

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
  Future<void> signOut() async {
   await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
  var user = FirebaseAuth.instance.currentUser;
  return user != null;
  }
  
  @override
  Future<void> sendUserToBack(UserModel user) async {
    var response;
    try {

        // Obtenha o token do Firebase
        final token = await getFirebaseToken();

        if (token == null) {
          print('Usuário não autenticado');
          return;
        }
        
        response = await http.post(
          Uri.parse('${Constants.conectionBackendURL}user'),
          headers: Constants.headers,
          body: jsonEncode(user.toJson()),
        );

        if (response.statusCode == 201) {
          log(response.body);
        }
      } catch (e) {
        throw Exception('Error: $e, ${response.statusCode}');
      }
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