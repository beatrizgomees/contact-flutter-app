import 'package:contact_book_app/domain/model/contact_model.dart';
import 'package:contact_book_app/features/shared/ui/commom/icon_button_component.dart';
import 'package:contact_book_app/features/shared/ui/commom/info_card_component.dart';
import 'package:contact_book_app/features/shared/utils/themes/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

class Profilepage extends StatefulWidget {
  Profilepage({super.key,  this.contactModel});
  
  ContactModel? contactModel;

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
      appBar: AppBar(
        backgroundColor:AppTheme.backgroundPrincipalColor
      ),
     body: Stack(
       children: [
        Center(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTopSectionProfileView(context),

            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 50),
              child: 
              Column(
              children: [
               Text(widget.contactModel!.name!, 
              style: AppTheme.titleProfileName),

              const SizedBox(height: 20),
              _buildListHorizontalOptions(context)
              ]
              ),
            ),

            
               Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40), 
                    topRight: Radius.circular(40))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  InfoCardComponent(pathImage: "assets/icons/telefone.png", info: "(81) 9 9166-4621",isContact: true),
                  InfoCardComponent(pathImage: "assets/icons/o-email.png", info: "beatrizgomesxx@gmail.com",),
                  const SizedBox(height: 10),
                  
                  _buildListHorizontalSocialMedia(context),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Call history", style: AppTheme.blackFontStyleTitle,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextButton(onPressed: () {}, child: const Text("Show more")),
                      )
                    ],
                   )
                  ],
                ),
               )
            ],
          ),
       ),
       ],
     ),
    );
  }
}


_buildTopSectionProfileView(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
          const CircleAvatar(
        radius: 50,
      
      ),
        Positioned(
      right: 125, // Alinhado à direita
      top: 10,
      child: Container(
        width: 50,
        decoration: BoxDecoration(color: Colors.green.shade300, borderRadius: BorderRadius.circular(20)),
        child: const Center(child: Text("Online", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600,),)))
        ),
      Positioned(
      right: 150, 
      bottom: 0,
      child: IconButton(
        icon: const Icon(Icons.edit), // Ícone que você deseja usar
        onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Wrap(
              children: [
                ListTile(
                    title: const Text("Camera"),
                    leading: const Icon(Icons.camera),
                    onTap: () async {
                    //viewModel.takeImage(null);
                    },),
                ListTile(
                  title: const Text("Galery"),
                  leading: const Icon(Icons.photo),
                  onTap: () async {
                  },
                )
              ],
            );
          },
        );
        },
      ),
      ),
    

      ]
    )
  );
}
  _buildListHorizontalOptions(BuildContext context){
  return Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButtonComponent(
      isIcon: false, 
      colorshadow: Colors.black,
      colorContainer: Colors.white,
      image: 'assets/icons/telefone.png'),
    const SizedBox(width: 20),
    IconButtonComponent(
      isIcon: false, 
      colorshadow: Colors.black,
      colorContainer: Colors.white,
      image: 'assets/icons/camera-de-video.png'),
      
      const SizedBox(width: 20),
      IconButtonComponent(
      isIcon: false, 
      colorContainer: Colors.white,
      colorshadow: Colors.black,
      image: 'assets/icons/bater-papo.png'),
      
      const SizedBox(width: 20),
      IconButtonComponent(
      colorshadow: Colors.black,
      colorContainer: Colors.white,
      isIcon: false, 
      image: 'assets/icons/o-email.png'),
      
    
  ],
);
}

_buildListHorizontalSocialMedia(BuildContext context){
  return   Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
    children: [
  
    IconButtonComponent(
    width: 50, 
    height: 50, 
    colorContainer: Colors.white, 
    colorIcon: Colors.black,
    colorshadow: Colors.grey.withOpacity(0.5),
    isIcon: true,
      icon: Icon(Bootstrap.twitter_x)),
  const SizedBox(width: 30),
    IconButtonComponent(
    width: 50, 
    height: 50, 
    colorContainer: Colors.white, 
    colorIcon: Colors.black,
    colorshadow: Colors.grey.withOpacity(0.5),
    isIcon: true,
      icon: Icon(Bootstrap.instagram)),

const SizedBox(width: 30),
  IconButtonComponent(
    width: 50, 
    height: 50, 
    colorContainer: Colors.white, 
    colorIcon: Colors.black,
    colorshadow: Colors.grey.withOpacity(0.5),
    isIcon: true,
      icon: Icon(Bootstrap.whatsapp))
    ],
  );
}