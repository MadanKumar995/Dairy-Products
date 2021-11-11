import 'package:dairy_products/screens/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class prodpage extends StatelessWidget {
  prodpage({
    Key? key,
    required this.prod,
    required this.desc,
    required this.price,
    required this.img,
    required this.qnty,
  }) : super(key: key);

  var prod;
  var desc;
  var price;
  var img;
  var qnty;

  @override
  Widget build(BuildContext context) {
    final _firebase = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    String id = _auth.currentUser!.email.toString();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Hero(
                tag: img,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                left: 12,
                top: 26 + MediaQuery.of(context).padding.top,
                child: ClipOval(
                  child: Container(
                      height: 42,
                      width: 41,
                      decoration:
                          const BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 4),
                            blurRadius: 8),
                      ]),
                      child: Center(
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_outlined)),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Text(
                          prod,
                          style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Text(
                          qnty,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 30,
                          right: 30,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            desc,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: 20,
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    offset: Offset(0, -3),
                                    blurRadius: 12)
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 30),
                                      child: Text(
                                        '₹ ${price}',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          letterSpacing: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Material(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () async {
                                    var check = await _firebase
                                        .collection('Users')
                                        .doc(id)
                                        .collection('Cartpage')
                                        .doc(prod.toString())
                                        .get();

                                    if (check.data() == null) {
                                      Navigator.pop(context);
                                      Databaseservice(id)
                                          .addtocart(prod, price, img);

                                      Fluttertoast.showToast(
                                          msg: 'Added to cart');
                                      // print('executed');
                                    } else {
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                          msg: 'Already Added');

                                      // Snack(context, 'Already Added');

                                      // _firebase
                                      //     .collection('Users')
                                      //     .doc(id)
                                      //     .collection('Cartpage')
                                      //     .doc(widget.prod.toString())
                                      //     .delete();
                                      // print('deleted');
                                    }
                                    // print('click');
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade400,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  // Snack(context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     backgroundColor: Colors.green,
  //     content: Text(message),
  //     duration: Duration(seconds: 2),
  //   ));
  // }
}
