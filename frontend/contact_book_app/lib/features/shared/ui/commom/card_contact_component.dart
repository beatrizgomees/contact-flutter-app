import 'package:contact_book_app/features/contact/model/contact_model.dart';
import 'package:contact_book_app/features/shared/ui/widgets/favorite_button_widget.dart';
import 'package:contact_book_app/features/shared/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardContactComponent extends StatefulWidget {
  CardContactComponent({super.key,  required this.contactModel});

  ContactModel contactModel;
 


  @override
  State<CardContactComponent> createState() => _CardContactComponentState();
}

class _CardContactComponentState extends State<CardContactComponent> {

  bool favorite = false;
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding:  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        //border: Border.all(color: Colors.white)
      ),
      child:   Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              minRadius: 30,
              child: ClipOval(
                child: Image.asset("assets/images/perfil.jpg",    fit: BoxFit.cover,
                  width: 60, 
                  height: 60,   
                  ),
                ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${widget.contactModel.name}", style: AppTheme.whiteFontStyleTitle,),
                Text("${widget.contactModel.email}", style: AppTheme.whiteFontStyleContatcSubtitle,
                ),

            ],
          ),
           FavoriteIconButton(contactModel: widget.contactModel)
          
        ],
      ),
    ),
    );
  }
}