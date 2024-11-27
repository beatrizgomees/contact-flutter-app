import 'package:contact_book_app/domain/model/user_model.dart';
import 'package:contact_book_app/features/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceImpl implements AuthService{
  
  late FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  late Stream<User?> authStateChanges = _firebaseAuth.authStateChanges();
  User? _user;
  
  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password,
      
    );

    initAuth();

  }
  

  
  @override
  Future<void> createUserWithEmailAndPassword({
    required String email, 
    required String password,
    
    }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password,
    );
  }
  
  @override
  Future<void> signOut() async {
   await _firebaseAuth.signOut();
  }

  @override
  Future<void> isLoggedIn() async {
  var user = FirebaseAuth.instance.currentUser;

  }

  @override
  Future<bool> isLoggedInValue() async {
  var user = FirebaseAuth.instance.currentUser;
  return user != null;
  }
  
  @override
  Future<void> initAuth() async {
    _firebaseAuth = FirebaseAuth.instance;
    authStateChanges = _firebaseAuth.authStateChanges();
    authStateChanges.listen((User? user){
        _user = user;
        print(user!.displayName);
    });
  }

  
}