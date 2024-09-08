import 'package:flutter/material.dart';
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
      backgroundColor: Color.fromRGBO(20, 29, 41,1),
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(20, 29, 41,1),
      ),
     body: Center(
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

          Text("Beatriz Gomes", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),),
          Text("81991664621", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
          Text("beatrizgomesxx@gmail.com", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
        
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
                  child: IconButton(onPressed:  () { }, icon: Icon(Bootstrap.telephone),),
                ),
                SizedBox(width: 20),
                  Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
                  child: IconButton(onPressed:  () { }, icon: Icon(Bootstrap.camera_video),),
                ),
                  SizedBox(width: 20),
                  Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white,),
                  child: IconButton(onPressed:  () { }, icon: Icon(Bootstrap.chat),),
                ),
                  SizedBox(width: 20),
                  Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white,),
                  child: IconButton(onPressed:  () { }, icon: Icon(AntDesign.send_outline),),
                )
              ],
            ),
          ),
             
          ],
        ),
     ),
    );
  }
}