import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/domain/model/user_model.dart';
import 'package:contact_book_app/domain/service/user_service.dart';
import 'package:contact_book_app/features/shared/utils/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService{

  var contacts = Constants.schedulle;
  
  @override
  Future<void> deleteUser(Long id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<QuerySnapshot<Object?>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(UserModel userModel) async {
    final DocumentReference docRef = await contacts.add({
    'name':userModel.name,
    'email': userModel.email,
    'phone': userModel.phone,
    'objectId': userModel.objectId,
    'contactListModel': userModel.contactModelList
   });
  }

  @override
  Future<void> updateUser(UserModel userModel) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  Future<UserModel?> fetchLoggedInUser() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final snapshot = await FirebaseFirestore.instance
        .collection('schedulle')
        .doc(user.uid)
        .get();

    if (snapshot.exists) {
      return UserModel.fromMap(snapshot.data()!);
    }
  }
  return null;
}
  
}