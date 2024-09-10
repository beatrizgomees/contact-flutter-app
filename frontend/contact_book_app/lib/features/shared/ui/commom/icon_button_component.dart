import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconButtonComponent extends StatefulWidget {
  IconButtonComponent({super.key, required this.width, required this.height, required this.colorContainer, required this.colorIcon, required this.icon});
  double width;
  double height;
  Color colorContainer;
  Color colorIcon;
  Icon icon;

  @override
  State<IconButtonComponent> createState() => _IconButtonComponentState();
}

class _IconButtonComponentState extends State<IconButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child:widget.icon
    );
  }
}