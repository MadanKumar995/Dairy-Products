import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dairy_products/screens/home/homep.dart';
import 'package:dairy_products/screens/home/wishlist.dart';
import 'package:dairy_products/screens/profile.dart';
import 'package:dairy_products/values.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentindex = 1;
  final screens = [Profile(), Homep(), Mywishlist()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green.withOpacity(0.8),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: colorconst.pcolor,
        height: 48,
        index: 1,
        onTap: (index) => setState(() => currentindex = index),
        items: const [
          Icon(Icons.person_outline, color: Colors.white),
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.favorite_border_outlined, color: Colors.white),
        ],
        animationDuration: const Duration(milliseconds: 400),
        animationCurve: Curves.bounceInOut,
      ),
    );
  }
}
