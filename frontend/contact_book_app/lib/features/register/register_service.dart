import 'package:contact_book_app/features/auth/model/user_model.dart';

abstract class RegisterService{
 Future<void> registerUser(UserModel user);
}