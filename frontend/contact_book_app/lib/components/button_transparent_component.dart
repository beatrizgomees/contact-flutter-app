import 'package:flutter/material.dart';

class ButtonTransparentComponent extends StatelessWidget {
   ButtonTransparentComponent({
    
  super.key,
   required this.height,
   required this.width,
   required this.colorBorder,
   required this.border,
   required this.title,
   this.icon,
   this.iconSize,
   required this.colortitle,
   this.colorIcon,
   required this.sizeTitle,
   this.fontWeight
   });

   double height;
   double width;
   Color colorBorder;
   double border;
   String title;
   IconData? icon;
   double? iconSize;
   Color colortitle;
   Color? colorIcon;
   double sizeTitle;
   FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: Colors.transparent,
        border: Border.all(color: colorBorder, width: 1)
      ),
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Text(title, 
            style: TextStyle(
              fontSize: sizeTitle, 
              color:colortitle,
              fontWeight: fontWeight
              ),
            ),
            const SizedBox(width: 10),
            Icon(icon, size: iconSize, color: colorIcon,)
          ],
        ),
        ),
    );
  }
}