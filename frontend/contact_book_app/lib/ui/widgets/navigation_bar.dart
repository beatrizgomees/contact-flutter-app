import 'package:contact_book_app/features/call/call_history_view.dart';
import 'package:contact_book_app/features/contact_crud/edit_list_contact_view.dart';
import 'package:contact_book_app/utils/themes/AppTheme.dart';
import 'package:contact_book_app/features/profile/ProfilePage.dart';
import 'package:contact_book_app/features/contact_crud/create_contact_view.dart';
import 'package:contact_book_app/features/home/home_view.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

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
      const CallHistoryView(),
      EditListContactView(),
      CreateContactView(),
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
        child: CurvedNavigationBar(
          backgroundColor: _selectedTab.index == 5 ? Colors.white : Colors.black.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: const [
            CurvedNavigationBarItem(
                child: Icon(Icons.chat_bubble_outline),
                label: 'Chat',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.call_end_outlined),
                label: 'Call',
              ),
                 
              CurvedNavigationBarItem(
                child: Icon(Bootstrap.list),
                label: 'List',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.add),
                label: 'Add Contact',
              ),
              CurvedNavigationBarItem(
                child: Icon(Icons.perm_identity),
                label: 'Personal',
              ),
            ],
         
        ),
      ),
    );
  }
}

enum _SelectedTab { home, call, create, list, person }