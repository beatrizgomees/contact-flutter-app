import 'package:flutter/material.dart';

class SignWithExternalAccountWidget extends StatelessWidget {
   SignWithExternalAccountWidget({
    super.key,
    required this.pathImage,  
    required this.heightImage,  
    required this.widthImage, 
    required this.title,  
    required this.colorName
  });


  String pathImage;  
  double heightImage;
  double widthImage;
  String title;
  Color colorName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 40,
          width: 150,
          decoration:  BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
      
          ),
          child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(pathImage, 
              height: heightImage, 
              width: widthImage),
              Text(title, 
              style: TextStyle(
                color: colorName,
                fontWeight: FontWeight.bold
                ),
                ),
            ],
          ),
          ),
        ),
    );
  }
}

