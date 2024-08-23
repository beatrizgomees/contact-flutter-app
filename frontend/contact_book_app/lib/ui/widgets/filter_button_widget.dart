import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterButton extends StatefulWidget {
   FilterButton({super.key, required this.label});
  String label;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: 150,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      color: Colors.white,
        ),
        child:  Center(
          child: Text(widget.label, style: TextStyle(
            fontSize: 16
          ),
          ),
        ),
      ),
    );
  }
}