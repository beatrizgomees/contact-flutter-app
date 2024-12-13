import 'package:contact_book_app/features/contact/model/contact_model.dart';

abstract class RegisterService{
  Future<void> createUserWithEmailAndPassword({required ContactModel contact});
}