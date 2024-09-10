import 'package:contact_book_app/features/contact_crud/model/contact_model.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

// ignore: must_be_immutable
class ChatView extends StatefulWidget {
   ChatView({super.key, required this.contactModel});

  ContactModel contactModel;
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
      appBar: AppBar(
        foregroundColor:Colors.white,
         backgroundColor: AppTheme.backgroundPrincipalColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(),
            ),
            Text(widget.contactModel.name!, style: AppTheme.titleWhiteFont,),

          
          ],
          
        ),
        actions: const [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Icon(Bootstrap.telephone,  color: Colors.white,),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Icon(Bootstrap.camera_video, color: Colors.white,),
            )
        ],
     
        
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFormField(
              
              decoration: InputDecoration(
                
                hintText: "write a message",
                fillColor: Colors.white,
                focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  gapPadding: 20,
                  borderRadius: BorderRadius.circular(10),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),  // Cor do contorno quando está focado
                  gapPadding: 50,
                  borderRadius: BorderRadius.circular(10),
          ),
              ),
            )
          ],
        ),
      ),
    );
  }
}