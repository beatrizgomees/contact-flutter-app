import 'package:flutter/material.dart';

class FavoriteIconButton extends StatefulWidget {
  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
      ),
      icon: Icon(
        Icons.star,
        color: isFavorite ? Colors.yellowAccent.shade700 : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; 
        });
      },
    );
  }
}
