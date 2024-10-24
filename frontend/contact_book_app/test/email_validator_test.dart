
import 'package:contact_book_app/features/shared/utils/validators/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });


  group('email validator', () {


 test('should return a message if the email null', 
  (){
    final result = emailValidator.validate();
    expect(result, equals('This email is required'));
  }
  
  );

  test('shoul return a error message if email is empty', () {
    final result = emailValidator.validate(email: '');
    expect(result, equals('This email is required'));
  });


  test('should return a error message if email is invalid',
  () {
    final result = emailValidator.validate(email: 'bea');
    expect(result, equals('The email is invalid'));
  });


  test('should return null if email for valid', (){
    final result = emailValidator.validate(email: 'bea@gmail.com');
      expect(result, isNull);
  });


  });
}