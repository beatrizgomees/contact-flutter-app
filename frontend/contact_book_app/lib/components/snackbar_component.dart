import 'package:flutter/material.dart';


SnackBar SnackbarComponent(String message, Color color){
  return SnackBar(
    backgroundColor: color,
    content:  Text(message, style: TextStyle(color: Colors.black),),
    duration: const Duration(milliseconds: 1500),
    width: 280.0, // Width of the SnackBar.
    elevation: 50,
    padding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
  

