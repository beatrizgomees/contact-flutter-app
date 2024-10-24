import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageButtonComponent extends StatefulWidget {
   ImageButtonComponent({super.key, required this.width, required this.height, required this.image});
   double width;
   double height;
   String image;

  @override
  State<ImageButtonComponent> createState() => _ImageButtonComponentState();
}

class _ImageButtonComponentState extends State<ImageButtonComponent> {
  @override
  Widget build(BuildContext context) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
    child: Image.asset('assets/icons/camera-de-video.png')
  );
  }
}