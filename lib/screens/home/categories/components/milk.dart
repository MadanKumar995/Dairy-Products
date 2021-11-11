// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Milk extends StatelessWidget {
  Milk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mail = FirebaseAuth.instance.currentUser!.email.toString();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'assets/categories/Milk/milkbottle.jpg',
                    child: Image.asset(
                      'assets/categories/Milk/milkbottle.jpg',
                      height: 200,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Hero(
                tag: 'Milk',
                child: Text(
                  "Milk",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  height: 120,
                  width: 350,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'cowmilk');
                        },
                        child: Row(
                          children: [
                            Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Hero(
                                    tag: 'assets/categories/Milk/cowmilk.jpg',
                                    child: Image.asset(
                                      'assets/categories/Milk/cowmilk.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                            Container(
                              child: RichText(
                                  text: TextSpan(
                                      text: "Cow Milk\n",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                    TextSpan(
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        children: [
                                          TextSpan(
                                              text: "  ₹ 37",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20))
                                        ])
                                  ])),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          margin: const EdgeInsets.only(right: 0),
                        ),
                      ),
                      StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .doc(mail)
                              .collection('wishlist')
                              .doc('Cow Milk')
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            try {
                              final data = snapshot.requireData;
                              bool isfav = data['fav'];
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                child: IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(mail)
                                          .collection('wishlist')
                                          .doc('Cow Milk')
                                          .delete();
                                    },
                                    icon: Icon(Icons.favorite,
                                        color: Colors.green)),
                              );
                            } catch (e) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                child: IconButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(mail)
                                          .collection('wishlist')
                                          .doc('Cow Milk')
                                          .set(({
                                            'Name': 'Cow Milk',
                                            'price': '₹ 37',
                                            'fav': true,
                                            'image':
                                                'assets/categories/Milk/cowmilk.jpg',
                                            'path': 'cowmilk',
                                          }));
                                    },
                                    icon: Icon(Icons.favorite_border,
                                        color: Colors.green)),
                              );
                            }
                          }),
                    ],
                  )),
              Container(
                  height: 120,
                  width: 350,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'buffalomilk');
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Hero(
                                tag: 'assets/categories/Milk/buffalomilk.jpg',
                                child: Image.asset(
                                  'assets/categories/Milk/buffalomilk.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Buffalo Milk\n",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    children: [
                                      TextSpan(
                                          text: "  ₹ 44",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20))
                                    ])
                              ])),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            margin: const EdgeInsets.only(right: 0),
                          ),
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(mail)
                                .collection('wishlist')
                                .doc('Buffalo Milk')
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              try {
                                final data = snapshot.requireData;
                                bool isfav = data['fav'];
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(mail)
                                            .collection('wishlist')
                                            .doc('Buffalo Milk')
                                            .delete();
                                      },
                                      icon: Icon(Icons.favorite,
                                          color: Colors.green)),
                                );
                              } catch (e) {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(mail)
                                            .collection('wishlist')
                                            .doc('Buffalo Milk')
                                            .set(({
                                              'Name': 'Buffalo Milk',
                                              'price': '₹ 44',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Milk/buffalomilk.jpg',
                                              'path': 'buffalomilk',
                                            }));
                                      },
                                      icon: Icon(Icons.favorite_border,
                                          color: Colors.green)),
                                );
                              }
                            }),
                      ],
                    ),
                  )),
              Container(
                  height: 120,
                  width: 350,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'skimmedmilk');
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Hero(
                                tag: 'assets/categories/Milk/skimmedmilk.jpg',
                                child: Image.asset(
                                  'assets/categories/Milk/skimmedmilk.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Skimmed Milk\n",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    children: [
                                      TextSpan(
                                          text: "  ₹ 26",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20))
                                    ])
                              ])),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            margin: const EdgeInsets.only(right: 0),
                          ),
                        ),
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(mail)
                                .collection('wishlist')
                                .doc('Skimmed Milk')
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              try {
                                final data = snapshot.requireData;
                                bool isfav = data['fav'];
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(mail)
                                            .collection('wishlist')
                                            .doc('Skimmed Milk')
                                            .delete();
                                      },
                                      icon: Icon(Icons.favorite,
                                          color: Colors.green)),
                                );
                              } catch (e) {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(mail)
                                            .collection('wishlist')
                                            .doc('Skimmed Milk')
                                            .set(({
                                              'Name': 'Skimmed Milk',
                                              'price': '₹ 26',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Milk/skimmedmilk.jpg',
                                              'path': 'skimmedmilk',
                                            }));
                                      },
                                      icon: Icon(Icons.favorite_border,
                                          color: Colors.green)),
                                );
                              }
                            }),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
