import 'package:dairy_products/screens/authenticate/authenticate.dart';
import 'package:dairy_products/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    User? curuser = _auth.currentUser;

    //return either home or auth

    _auth.userChanges().listen((User? user) {
      curuser = user;
    });
    if (curuser == null) {
      return Authenticate();
    } else {
      return Homepage();
    }
  }
}
