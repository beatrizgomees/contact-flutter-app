import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_book_app/features/auth/model/user_model.dart';
import 'package:contact_book_app/features/register/register_service.dart';
import 'package:contact_book_app/features/shared/utils/constants/constants.dart';

class RegisterServiceImpl implements RegisterService{

  var users = Constants.user;


  @override
  Future<void> registerUser(UserModel user) async {
  //   final DocumentReference docRef = await users.add({
  //   'name':user.name,
  //   'email': user.email,
  //   'password': user.password,
  //   'phone': user.phone
  //  });

  //  final String id = docRef.id; //Atribuição do valor do id 
  //  users.doc(id).update({'objectId': id});
  }
  
}