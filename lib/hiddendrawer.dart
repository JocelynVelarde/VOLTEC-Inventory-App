import 'package:app_la_buena/MyGridScreen.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final textStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Home",
            baseStyle: textStyle,
            selectedStyle: textStyle,
            colorLineSelected: Colors.blue,
          ),
          const MyGridScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Profile",
            baseStyle: textStyle,
            selectedStyle: textStyle,
            colorLineSelected: Colors.blue,
          ),
          const MyGridScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "3D Viewer",
            baseStyle: textStyle,
            selectedStyle: textStyle,
            colorLineSelected: Colors.blue,
          ),
          const MyGridScreen()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Color.fromARGB(255, 10, 49, 85),
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 40,
      contentCornerRadius: 60,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 40,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    );
  }
}
