import 'package:contact_book_app/features/contact_crud/contact_model.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:flutter/material.dart';

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
         backgroundColor: AppTheme.backgroundPrincipalColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(),
            ),
            Text(widget.contactModel.name!, style: const TextStyle(fontSize: 15),),

          
          ],
          
        ),
        actions: const [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Icon(Icons.phone),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Icon(Icons.camera_alt_outlined),
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
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
                  gapPadding: 20,
                  borderRadius: BorderRadius.circular(10),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),  // Cor do contorno quando está focado
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