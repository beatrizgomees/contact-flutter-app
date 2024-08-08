import 'package:contact_book_app/ui/commum_components/button_transparent_component.dart';
import 'package:contact_book_app/utils/navigators/navigator_to.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopSectionComponent extends StatelessWidget implements PreferredSizeWidget{

  @override
  Size get preferredSize => const Size.fromHeight(200);

  TopSectionComponent({
  super.key,
  required this.titleSection,
  required this.titleButtonLoginOrRegister,
  required this.routeName
});

  String titleSection;
  String titleButtonLoginOrRegister;
  String routeName;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
       preferredSize: const Size.fromHeight(100),
        child: AppBar(
            backgroundColor: Colors.black,
            toolbarHeight: MediaQuery.of(context).size.height / 4,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  children: [
                    Text(titleSection,   
                    style: const TextStyle(
                      fontSize: 35, 
                      color: Colors.white,
                      ),
                    ),
                    const Text(" Account", 
                    style: TextStyle(
                      fontSize: 35, 
                      fontStyle: FontStyle.italic, 
                      color: Colors.white,
                      ),
                    ),
                   
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                   navigateTo(context, routeName);
                  },
                  child: ButtonTransparentComponent(
                    height: 35,
                    width: 200,
                    border: 50,
                    colorBorder: Colors.white,
                    colortitle: Colors.white,
                    title: titleButtonLoginOrRegister, 
                    icon: Icons.arrow_forward,
                    iconSize: 20,
                    colorIcon: Colors.white,
                    sizeTitle: 16,
      
                    ),
                )
              ],
            ),
          ),
    );
  }
  

}