import 'package:contact_book_app/features/shared/ui/commom/icon_button_component.dart';
import 'package:contact_book_app/features/shared/ui/commom/info_card_component.dart';
import 'package:contact_book_app/features/shared/utils/themes/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

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
              Container(
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
                ),
              ),
            const SizedBox(height: 20),
                
            const Text("Beatriz Gomes", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),),
          
          
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
                    child:Image.asset('assets/icons/telefone.png')
                  ),
                  const SizedBox(width: 20),
                    Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
                    child: Image.asset('assets/icons/camera-de-video.png')
                  ),
                    const SizedBox(width: 20),
                    Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
                    child:Image.asset('assets/icons/bater-papo.png')
                  ),
                    const SizedBox(width: 20),
                    Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white,),
                    child: Image.asset('assets/icons/o-email.png')
                  )
                ],
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
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                    
                      IconButtonComponent(
                      width: 50, 
                      height: 50, 
                      colorContainer: Colors.white, 
                      colorIcon: Colors.black,
                       icon: Icon(Bootstrap.twitter_x)),
                    const SizedBox(width: 30),
                     IconButtonComponent(
                      width: 50, 
                      height: 50, 
                      colorContainer: Colors.white, 
                      colorIcon: Colors.black,
                       icon: Icon(Bootstrap.instagram)),

                  const SizedBox(width: 30),
                    IconButtonComponent(
                      width: 50, 
                      height: 50, 
                      colorContainer: Colors.white, 
                      colorIcon: Colors.black,
                       icon: Icon(Bootstrap.whatsapp))
                     ],
                   ),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Call history", style: TextStyle(fontSize: 18),),
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