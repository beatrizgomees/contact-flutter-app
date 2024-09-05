import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterButton extends StatefulWidget {
  FilterButton({super.key, required this.label, required this.onPressed, this.isFavorite});
  String label;
  final VoidCallback? onPressed;
  bool? isFavorite;
  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 150,
          height: 30,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: widget.isFavorite == true && widget.label == "Favorites" ? Colors.grey : Colors.white,
          ),
          child:  Center(
            child: Text(widget.label, style: TextStyle(
              fontSize: 16,
              color:widget.isFavorite == true && widget.label == "Favorites" ? Colors.white : Colors.black,
            ),
            ),
          ),
        ),
      ),
    );
  }
}