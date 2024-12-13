
import 'package:contact_book_app/features/auth/model/user_model.dart';

abstract class AuthService{

  Future<void> signInWithEmailAndPassword({required String email, required String password});
  Future<void> signOut();
  Future<bool> isLoggedIn();
  Future<void> sendUserToBack(UserModel user);
  Future<String?> getFirebaseToken();
}