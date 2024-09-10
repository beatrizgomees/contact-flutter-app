import 'package:contact_book_app/ui/commum_components/icon_button_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

// ignore: must_be_immutable
class InfoCardComponent extends StatelessWidget {
  InfoCardComponent({super.key, required this.pathImage, required this.info, this.isContact});

  String pathImage;
  String info;
  bool? isContact;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
        ),
        child:  Row(
          children: [
            Image.asset("$pathImage"),
            const SizedBox(width: 10),
             Text(info, 
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.w400, 
              color: Colors.black),),
            SizedBox(width: isContact == true ? 130 : 50),
            isContact == true ?
            IconButtonComponent(
              width: 50, 
              height: 50, 
              colorContainer: Colors.white, 
              colorIcon: Colors.black,
                icon: Icon(Bootstrap.heart)) :  SizedBox.shrink(),
          ] ,
        ),
        ),
    );
  }
}