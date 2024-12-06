class UserModel{
  String? objectId;
  String? email;
  String? password;
  String? name;
  String? phone;


  UserModel({
  this.objectId,
  this.name,
  this.password,
  this.email,
  this.phone
    });
    

  
  factory UserModel.fromMap(Map<String, dynamic> data) {
  return UserModel(
    objectId: data['objectId'],
    name: data['name'],
    email: data['email'],
    password: data['password'],
    phone: data['phone']
  );
}

 Map<String, dynamic> toMap() {
    return {
      'objectId': objectId,
      'name': name,
      'password': password,
      'phone': phone,
      'email': email,
      
    };
  }
}