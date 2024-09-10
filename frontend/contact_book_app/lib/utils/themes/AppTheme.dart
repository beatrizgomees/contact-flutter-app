import 'package:flutter/material.dart';

class AppTheme{

  static var whiteAccent = Colors.white;
  static Color backgroundPrincipalColor = Color.fromRGBO(20, 29, 41,1);
  static Color detailsColor = whiteAccent;
  static Color iconColors = Color.fromRGBO(136, 141, 242,1);

  //static Color backgroundPrincipalColor = Color.fromRGBO(41, 37, 120,1);


  static TextStyle get whiteFontStyleContactName => TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static TextStyle get whiteFontStyleContatcSubtitle => TextStyle(
    color: Colors.white,
    fontSize: 13,
  );

    static TextStyle get titleWhiteFont => TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

}