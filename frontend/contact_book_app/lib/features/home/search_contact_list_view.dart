import 'package:contact_book_app/features/shared/model/contact_model.dart';
import 'package:contact_book_app/features/shared/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
   const ContactsList({
    required this.contact,
    super.key,
  });

  final List<ContactModel> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
      body: ListView.builder(
        itemCount: contact.length,
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact[index].name!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(contact[index].phone!.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}