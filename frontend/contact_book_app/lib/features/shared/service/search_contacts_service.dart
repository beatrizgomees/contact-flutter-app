import 'package:contact_book_app/features/shared/model/contact_model.dart';
import 'package:contact_book_app/features/home/search_contact_list_view.dart';
import 'package:flutter/material.dart';

class SearchContactsService extends SearchDelegate{
  SearchContactsService({required this.contacts});

  final List<ContactModel> contacts;
  List<ContactModel> results = <ContactModel>[];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query.isEmpty ? close(context, null) : query = '',
      );
  }

  @override
  Widget? buildLeading(BuildContext context) {
      IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    results.isEmpty
    ? const Center(
        child: Text('No Results', style: TextStyle(fontSize: 24)),
      )
    : ContactsList(contact: results);
    return ContactsList(contact: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    results = contacts.where((ContactModel contact) {
    final String title = contact.name!.toLowerCase();
    final int body = contact.phone!;
    final String input = query.toLowerCase();

    return title.contains(input) || body.toString().contains(input);
  }).toList();

  return results.isEmpty
      ? const Center(
          child: Text('No Results', style: TextStyle(fontSize: 24)),
        )
      : ContactsList(contact: results);
  }
  
}