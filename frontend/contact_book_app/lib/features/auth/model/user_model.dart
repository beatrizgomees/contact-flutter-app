class UserModel{

  String? email;
  String? password;
  String? token;


  UserModel({
  this.password,
  this.email,
  this.token
    });
    

  
  factory UserModel.fromMap(Map<String, dynamic> data) {
  return UserModel(
    email: data['email'],
    password: data['password'],
    token: data['token']
  );
}

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'token': token,
    };
  }
}