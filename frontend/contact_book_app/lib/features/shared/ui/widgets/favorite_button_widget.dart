import 'package:contact_book_app/features/contact/model/contact_model.dart';
import 'package:contact_book_app/features/home/home_view_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteIconButton extends StatefulWidget {
  FavoriteIconButton({super.key, required this.contactModel});

  ContactModel contactModel;
  

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();

}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      icon: Icon(
        Icons.star,
        color: widget.contactModel.favorite == true ? Colors.yellowAccent.shade700 : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; 
          homeViewModel.updateFavorite(widget.contactModel.objectId, isFavorite);
           homeViewModel.fetchContacts();

        });
      },
    );
  }
}
