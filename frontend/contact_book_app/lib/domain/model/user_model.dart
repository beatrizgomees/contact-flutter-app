import 'package:contact_book_app/domain/model/contact_model.dart';

class UserModel{
   String? _objectId;
   String? _name;
   int? _phone;
   String? _email;
   String? _photo;
   List<ContactModel> contactModelList = [];


  UserModel(
  {String? objectId,
    String? name,
    required int phone,
  String? email,
  bool? favorite,
  bool? archive,
  String? photo,
  List<ContactModel>? contactModelList,
  }) {
  if (objectId != null) {
    _objectId = objectId;
  }
  if (photo != null) {
    _photo = photo;
  }
  if (name != null) {
    _name = name;
  }
    if (phone != null) {
    _phone = phone;
  }
  _phone = phone;
    if (email != null) {
    _email = email;
  }
  if (contactModelList != null) {
      contactModelList = contactModelList;
  }

}
  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId!;
  String? get name => _name;
  set name(String? name) => _name = name!;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;
  int? get phone => _phone;
  set phone(int? phone) => _phone = phone!;
  String? get email => _email;
  set email(String? email) => _email = email;
 


factory UserModel.fromMap(Map<String, dynamic> data) {
return UserModel(
  objectId: data['objectId'],
  name: data['name'],
  phone: data['phone'],
  photo: data['photo'],
  email: data['email'],
  contactModelList: (data['contactModelList'] as List<dynamic>?)
        ?.map((item) => ContactModel.fromMap(item as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> toMap() {
  return {
    'objectId': objectId,
    'name': name,
    'phone': phone,
    'email': email,
    'photo': photo,
    'contactModelList': contactModelList,
  };
}

}