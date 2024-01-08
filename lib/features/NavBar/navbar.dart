import 'package:flutter/material.dart';
import 'package:easy_bottom_navbar/easy_bottom_navbar.dart';
import 'package:resturant/features/home/home.dart';
import 'package:resturant/features/user/user.dart';

class GradientBar extends StatelessWidget {
  const GradientBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientNavBar(
      screenGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Colors.white],
      ),
      // List of widget screens to display for each navigation item
      widgetList: [User(), HomeScreen()],
      activeGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.red, Colors.red],
      ),
      // List of icons for the navigation items
      iconList: [Icons.supervised_user_circle_outlined, Icons.home],
    );
  }
}
