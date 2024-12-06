import 'package:contact_book_app/features/contact/views/create_contact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group('widget tests of create a contact', (){



    testWidgets('must confirm that the email field appears ', (test) async {

      await test.runAsync(() async {

      final future = Future<void>.error(42);

      await test.pumpWidget(FutureBuilder(
        future: future,
        builder: (_, snapshot) {
          return CreateContactView();
        },
      ));

    });
    testWidgets('ViewRequest: Waiting Types List', (WidgetTester tester) async {
    const childWidget = CircularProgressIndicator();

    
 

    // Verify that the page is loading until we receive the types.
    expect(find.byWidget(childWidget), findsOneWidget);
  });

  
    expect(find.byType(TextFormField), findsOneWidget);
  });
  });
}