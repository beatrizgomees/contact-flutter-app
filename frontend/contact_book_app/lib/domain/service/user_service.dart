import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/domain/model/user_model.dart';

abstract class UserService{

  Future<QuerySnapshot> getUser();
  Future<void> registerUser(UserModel userModel);
  Future<void> deleteUser(Long id);
  Future<void> updateUser(UserModel userModel);
  Future<UserModel?> fetchLoggedInUser();

}