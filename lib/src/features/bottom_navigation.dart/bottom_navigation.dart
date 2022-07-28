import 'package:eco/src/features/account/screen/account_screen.dart';
import 'package:eco/src/features/cart/screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco/src/features/home/screen/home_screen.dart';
import 'package:eco/src/utils/constants/app_constant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        navBarStyle: NavBarStyle.style13,
        screens: _buildScreens(),
        items: _navBarsItems(),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      Container(),
      CartScreen(),
      Container(),
      AccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shop),
        title: ("Settings"),
        activeColorPrimary: maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.notifications),
        title: ("Account"),
        activeColorPrimary: maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Account"),
        activeColorPrimary: maincolor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
