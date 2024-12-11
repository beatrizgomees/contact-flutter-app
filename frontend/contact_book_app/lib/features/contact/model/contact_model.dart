class ContactModel {
   String? objectId;
   String? name;
   String? phone;
   String? email;
   String? password;
   String? photo;
   bool? favorite = false;
   bool? archive = false;

 ContactModel({
  this.objectId,
  this.name,
  this.password,
  this.email,
  this.phone,
  this.photo,
  this.favorite = false,
  this.archive = false
    });
  
  
  
  factory ContactModel.fromMap(Map<String, dynamic> data) {
  return ContactModel(
    objectId: data['objectId'],
    name: data['name'],
    phone: data['phone'],
    photo: data['photo'],
    email: data['email'],
    password: data['password'],
    favorite: data['favorite'],
    archive: data['archive']
    
  );
}

  Map<String, dynamic> toJson() {
    return {
      'objectId': objectId,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'photo': photo,
      'favorite': favorite,
      'archive': archive
    };
  }
}
