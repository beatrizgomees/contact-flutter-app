import 'package:flutter/material.dart';

class AppTheme{

  static var yellowAccent = Color.fromARGB(255, 238, 177, 64);
  static Color backgroundPrincipalColor = Colors.white;
  static Color detailsColor = yellowAccent;



  static TextStyle get whiteFontStyleContactName => TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  static TextStyle get whiteFontStyleContatcSubtitle => TextStyle(
    color: Colors.black,
    fontSize: 13,
  );

    static TextStyle get appBarFontTheme => TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

}