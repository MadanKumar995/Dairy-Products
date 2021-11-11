import 'dart:async';
import 'package:dairy_products/screens/wrapper.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaymentDone extends StatefulWidget {
  @override
  _PaymentDoneState createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Navigator.popUntil(context, (route) => false);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Wrapper()));
    });
  }

  final mail = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Payment Done',
          style: TextStyle(
            fontSize: 24,
            letterSpacing: 1.3,
            color: colorconst.pcolor,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 100)),
            Container(
              child: const Icon(
                Icons.check_circle_outline,
                size: 180,
                color: Colors.green,
              ),
            ),
            _text('Order'),
            _text('Placed'),
            _text('Succesfully'),
          ],
        ),
      ),
    );
  }
}

Widget _text(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 40.0,
      letterSpacing: 1.3,
      fontWeight: FontWeight.w600,
      color: Colors.green,
    ),
  );
}
