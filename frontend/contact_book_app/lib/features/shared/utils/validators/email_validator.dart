class EmailValidator{

  String? validate({String? email}){
    if(email == null || email.isEmpty){
      return 'This email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return 'The email is invalid';
    }
    return null;

  }
}
