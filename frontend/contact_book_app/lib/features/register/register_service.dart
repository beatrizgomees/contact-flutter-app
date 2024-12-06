import 'package:contact_book_app/domain/model/user_model.dart';

abstract class RegisterService{
 Future<void> registerUser(UserModel user);
}