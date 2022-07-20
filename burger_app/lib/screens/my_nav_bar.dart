import 'package:Burger_App/screens/cart_screen.dart';
import 'package:Burger_App/screens/home_screen.dart';
import 'package:Burger_App/screens/note_screen.dart';
import 'package:Burger_App/screens/favourite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MyNavBar extends StatefulWidget{
  final AppBar appBar;

  const MyNavBar({Key? key, required this.appBar}): super(key: key);

  @override
  State<MyNavBar> createState() => MyNavBarState(appBar);
}

class MyNavBarState extends State<MyNavBar>{
  final AppBar appBar;
  PersistentTabController? _controller;


  MyNavBarState(this.appBar);

  List<Widget> _buildScreens(){
    return [
      HomeScreen(appBar: appBar),
      const CartScreen(),
      const FavouriteScreen(),
      const NoteScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.description),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }

}