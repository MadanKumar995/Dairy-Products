import 'dart:async';

import 'package:dairy_products/screens/wrapper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Wrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/WBG POP GIF.gif',
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo.shade900),
            ),
          ],
        ),
      ),
    );
  }
}
