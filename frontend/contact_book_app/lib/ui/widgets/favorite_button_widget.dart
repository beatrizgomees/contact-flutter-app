import 'package:contact_book_app/features/contact_crud/model/contact_model.dart';
import 'package:contact_book_app/features/contact_crud/service/contact_service_impl.dart';
import 'package:contact_book_app/features/home/home_view_model.dart';
import 'package:flutter/material.dart';

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
        color: isFavorite == true ? Colors.yellowAccent.shade700 : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; 
          ContactModel updateContact = ContactModel(
            name: widget.contactModel.name,
            email: widget.contactModel.email,
            phone: widget.contactModel.phone!,
            objectId: widget.contactModel.objectId,
            favorite: isFavorite
          );
          homeViewModel.updateFavorite(updateContact);

        });
      },
    );
  }
}
