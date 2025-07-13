import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class AbsBottomNav extends StatelessWidget {
  int selectedIndex;
  void Function(int)? onTabChange;

  AbsBottomNav({super.key, required this.onTabChange, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    Color headColor = Colors.blue;

    return SafeArea(
        child: GNav(
      gap: 10,
      selectedIndex: selectedIndex,
      onTabChange: onTabChange,
      color: Colors.black,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      activeColor: headColor, // border for active tab
      tabBorderRadius: 16,
      iconSize: 30,
      padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: 20), // button padding
      tabs: const [
        GButton(
          icon: Icons.home_outlined,
          text: 'Home',
        ),
        GButton(
          icon: Icons.track_changes_outlined,
          text: 'Track',
        ),
      ],
    ));
  }
}
