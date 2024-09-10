import 'package:flutter/material.dart';

void navigateTo(BuildContext context, String routeName) {
  Navigator.pushReplacementNamed(context, routeName);
}
