import 'package:contact_book_app/views/create_contact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('widget tests of create a contact', (){



    testWidgets('must confirm that the email field appears ', (test) async {

      await test.pumpWidget(
        const MaterialApp(
        home: CreateContactView(),
      ),
      );

      final emailKey = find.byKey(const Key('name_key'));
      expect(emailKey, findsOneWidget);
    });
  });
}