import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cheese extends StatelessWidget {
  const Cheese({Key? key}) : super(key: key);

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
                    tag: 'assets/categories/Cheese/cheese.jpg',
                    child: Image.asset(
                      'assets/categories/Cheese/cheese.jpg',
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
              Text(
                "Cheese",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                  height: 120,
                  width: 350,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'slicedcheese');
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
                                tag:
                                    'assets/categories/Cheese/slicedcheese.jpg',
                                child: Image.asset(
                                  'assets/categories/Cheese/slicedcheese.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Sliced Cheese\n",
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
                                          text: "  ₹ 73",
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
                                .doc('Sliced Cheese')
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
                                            .doc('Sliced Cheese')
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
                                            .doc('Sliced Cheese')
                                            .set(({
                                              'Name': 'Sliced Cheese',
                                              'price': '₹ 73',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Cheese/slicedcheese.jpg',
                                              'path': 'slicedcheese',
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
                      Navigator.pushNamed(context, 'wholecheese');
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
                                tag: 'assets/categories/Cheese/wholecheese.jpg',
                                child: Image.asset(
                                  'assets/categories/Cheese/wholecheese.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Whole Cheese\n",
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
                                          text: "  ₹ 110",
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
                                .doc('Whole Cheese')
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
                                            .doc('Whole Cheese')
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
                                            .doc('Whole Cheese')
                                            .set(({
                                              'Name': 'Whole Cheese',
                                              'price': '₹ 110',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Cheese/wholecheese.jpg',
                                              'path': 'wholecheese',
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
