import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IconButtonComponent extends StatefulWidget {
  IconButtonComponent({super.key, 
  this.width, 
  this.height, 
  this.colorContainer, 
  this.colorIcon, 
  this.icon, 
  this.image, 
  this.colorshadow,
  required this.isIcon});

  double? width = 50;
  double? height = 50;
  Color? colorContainer = Colors.white;
  Color? colorIcon = Colors.black;
  Icon? icon;
  bool isIcon = true;
  String? image;
  Color? colorshadow;

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
        color: widget.colorContainer,
        boxShadow: [
          BoxShadow(
            color: widget.colorshadow!,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child:widget.isIcon ? widget.icon : Image.asset(widget.image!)
    );
  }
}