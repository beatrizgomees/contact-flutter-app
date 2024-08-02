import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/views/ProfilePage.dart';
import 'package:contact_book_app/views/create_contact_view.dart';
import 'package:contact_book_app/views/home_view.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({Key? key}) : super(key: key);

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> with TickerProviderStateMixin{
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
List<Widget> pages = [
      const HomeView(),
      const CreateContactView(),
      const Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrincipalColor,
         body: pages[_SelectedTab.values.indexOf(_selectedTab)],
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          height: 10,
          // indicatorColor: Colors.blue,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: Icons.home,
              selectedColor: Colors.white,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: Icons.chat_bubble,
              selectedColor: Colors.white,
            ),

           

            /// Profile
            CrystalNavigationBarItem(
              icon: Icons.person_2,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, chat, notifications, person }