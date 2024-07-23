import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class TextFormFieldComponent extends StatefulWidget {
  TextFormFieldComponent(
      {super.key,
      required this.label,
      required this.keyboardType,
      required this.controllerText,
      required this.icon,
      required this.value});
  String label;
  Icon icon;
  TextInputType keyboardType;
  String value;
  TextEditingController controllerText;
  Key? keyValue;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.keyValue,
      textInputAction:TextInputAction.next,
      controller: widget.controllerText,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.value = value;
      },
   
      decoration: InputDecoration(
        icon: widget.icon,
        iconColor: Colors.white,
        filled: true,
        fillColor: Colors.white,
        hintText: widget.label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
          gapPadding: 20,
          borderRadius: BorderRadius.circular(10),
        ),
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),  // Cor do contorno quando está focado
          gapPadding: 50,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
