import 'dart:ffi';

class ContactModel {
   String? _objectId;
   String? _name;
   int? _phone;
   String? _email;
   String? _photo;
   bool _favorite = false;
   bool _archive = false;

  ContactModel(
      {String? objectId,
        String? name,
       required int phone,
      String? email,
      bool? favorite,
      bool? archive,
      String? photo}) {
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

    if(favorite != null){
      _favorite = favorite;
    } 
    
    if(archive != null){
      _archive = archive;
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

  bool? get favorite => _favorite;
  set favorite(bool? favorite) => _favorite = favorite!;  
  
  bool? get archive => _archive;
  set archive(bool? favorite) => _archive = archive!;
  
  factory ContactModel.fromMap(Map<String, dynamic> data) {
  return ContactModel(
    objectId: data['objectId'],
    name: data['name'],
    phone: data['phone'],
    photo: data['photo'],
    email: data['email'],
    favorite: data['favorite'],
    archive: data['archive']
    
  );
}

  Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'name': name,
      'phone': phone,
      'email': email,
      'photo': photo,
      'favorite': favorite,
      'archive': archive
    };
  }
}
