import 'package:dairy_products/screens/authenticate/sign_in.dart';
import 'package:dairy_products/screens/cartpage.dart';
import 'package:dairy_products/screens/home/categories/categories.dart';
import 'package:dairy_products/screens/home/categories/components/butter.dart';
import 'package:dairy_products/screens/home/categories/components/cheese.dart';
import 'package:dairy_products/screens/home/categories/components/icecreams.dart';
import 'package:dairy_products/screens/home/categories/components/Milk.dart';
import 'package:dairy_products/screens/home/categories/components/paneer.dart';
import 'package:dairy_products/screens/home/categories/components/yogurt.dart';
import 'package:dairy_products/screens/home/drawer/aboutus.dart';
import 'package:dairy_products/screens/home/drawer/terms.dart';
import 'package:dairy_products/screens/home/home.dart';
import 'package:dairy_products/screens/home/homep.dart';
import 'package:dairy_products/screens/home/homepage.dart';
import 'package:dairy_products/screens/home/prods/products.dart';
import 'package:dairy_products/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'home': (context) => Home(),
        'splashscreen': (context) => SplashScreen(),
        'signin': (context) => SignIn(),
        'homepage': (context) => Homepage(),
        'homep': (context) => Homep(),
        'categories': (context) => Categories(),
        'Milk': (context) => Milk(),
        'Cheese': (context) => Cheese(),
        'Butter': (context) => Butter(),
        'Icecreams': (context) => Icecreams(),
        'Paneer': (context) => Paneer(),
        'Yogurt': (context) => Yogurt(),
        'cart': (context) => Cartpage(),
        'cowmilk': (context) => CowMilk(),
        'buffalomilk': (context) => buffalomilk(),
        'skimmedmilk': (context) => skimmeedmilk(),
        'slicedcheese': (context) => slicedcheese(),
        'wholecheese': (context) => wholecheese(),
        'unsaltedbutter': (context) => unsaltedbutter(),
        'saltedbutter': (context) => saltedbutter(),
        'chocolate': (context) => chocolate(),
        'butterscotch': (context) => butterscotch(),
        'pista': (context) => pista(),
        'vanilla': (context) => vanilla(),
        'paneerbricks': (context) => paneerbricks(),
        'paneercubes': (context) => paneercubes(),
        'almondyogurt': (context) => almondyogurt(),
        'coconutyogurt': (context) => coconutyogurt(),
        'soyyogurt': (context) => soyyogurt(),
        'about': (context) => AboutUs(),
        'terms': (context) => Terms(),
      },
    );
    // );
  }
}
