import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardContactComponent extends StatefulWidget {
  CardContactComponent({super.key, required this.email, required this.name});

  String name;
  String email;


  @override
  State<CardContactComponent> createState() => _CardContactComponentState();
}

class _CardContactComponentState extends State<CardContactComponent> {

  bool favorite = false;
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding:  EdgeInsets.only(top: 20.0, bottom: 20),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        //border: Border.all(color: Colors.white)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.name}", style: AppTheme.darkFontStyleContactName,),
                Text("${widget.email}", style: AppTheme.darkFontStyleContatcSubtitle,
                ),

            ],
          ),
           IconButton.filledTonal(
             style: IconButton.styleFrom(
               backgroundColor: Colors.white
             ),
           icon: Icon(Icons.star, 
              color: favorite ? Colors.yellowAccent.shade700 : Colors.grey,
           ),
           onPressed: () {
            
          
           }, 
           )
          
        ],
      ),
    ),
    );
  }
}