// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:momo_go/momo/colors.dart';

class PersistentBottomBarScaffold extends StatefulWidget {
  /// pass the required items for the tabs and BottomNavigationBar
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      /// Using indexedStack to maintain the order of the tabs and the state of the
      /// previously opened tab
      body: IndexedStack(
        index: _selectedTab,
        children: widget.items
            .map((page) => Navigator(
                  /// Each tab is wrapped in a Navigator so that naigation in
                  /// one tab can be independent of the other tabs
                  key: page.navigatorkey,
                  onGenerateInitialRoutes: (navigator, initialRoute) {
                    return [
                      MaterialPageRoute(builder: (context) => page.tab)
                    ];
                  },
                ))
            .toList(),
      ),

      /// Define the persistent bottom bar
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        backgroundColor: Colors.white.withOpacity(0.10),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MomoColors.buttonColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedTab,
        onTap: (index) {
          /// Check if the tab that the user is pressing is currently selected
          if (index == _selectedTab) {
            /// if you want to pop the current tab to its root then use
            widget.items[index].navigatorkey?.currentState
                ?.popUntil((route) => route.isFirst);
            
            /// if you want to pop the current tab to its last page
            /// then use
            // widget.items[index].navigatorkey?.currentState?.pop();
          } else {
            setState(() {
              _selectedTab = index;
            });
          }
        },
        items: widget.items
            .map((item) => BottomNavigationBarItem(
                icon: item.icon, label: item.title))
            .toList(),
      ),
    );
  }
}

/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String title;
  final Widget icon;

  PersistentTabItem(
      {required this.tab,
      this.navigatorkey,
      required this.title,
      required this.icon});
}
