import 'package:flutter/material.dart';

class AppTheme{

  static var whiteAccent = Colors.white;
  static Color backgroundPrincipalColor = const Color.fromRGBO(20, 29, 41,1);
  static Color detailsColor = whiteAccent;
  static Color iconColors = const Color.fromRGBO(136, 141, 242,1);

  //static Color backgroundPrincipalColor = Color.fromRGBO(41, 37, 120,1);


  static TextStyle get whiteFontStyleContactName => const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  static TextStyle get whiteFontStyleContatcSubtitle => const TextStyle(
    color: Colors.white,
    fontSize: 13,
  );

    static TextStyle get titleWhiteFont => const TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

}