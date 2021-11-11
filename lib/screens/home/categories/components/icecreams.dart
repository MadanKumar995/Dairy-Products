import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fruitapp/pages/juicygrapes.dart';

class Icecreams extends StatelessWidget {
  const Icecreams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mail = FirebaseAuth.instance.currentUser!.email.toString();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: 'assets/categories/Icecreams/ice.jpg',
                    child: Image.asset(
                      'assets/categories/Icecreams/ice.jpg',
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
              const Text(
                "Ice creams",
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
                      Navigator.pushNamed(context, 'chocolate');
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
                                tag: 'assets/categories/Icecreams/chocice.jpg',
                                child: Image.asset(
                                  'assets/categories/Icecreams/chocice.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Chocolate\n",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    children: const [
                                      TextSpan(
                                          text: "  ₹ 190",
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
                                .doc('Chocolate')
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
                                            .doc('Chocolate')
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
                                            .doc('Chocolate')
                                            .set(({
                                              'Name': 'Chocolate',
                                              'price': '₹ 190',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Icecreams/chocice.jpg',
                                              'path': 'chocolate',
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
                      Navigator.pushNamed(context, 'butterscotch');
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
                                    'assets/categories/Icecreams/butterscotchice.jpg',
                                child: Image.asset(
                                  'assets/categories/Icecreams/butterscotchice.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Butterscotch\n",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    children: const [
                                      TextSpan(
                                          text: "  ₹ 187",
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
                                .doc('Butterscotch')
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
                                            .doc('Butterscotch')
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
                                            .doc('Butterscotch')
                                            .set(({
                                              'Name': 'Butterscotch',
                                              'price': '₹ 187',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Icecreams/butterscotchice.jpg',
                                              'path': 'butterscotch',
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
                      Navigator.pushNamed(context, 'pista');
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
                                tag: 'assets/categories/Icecreams/pistaice.jpg',
                                child: Image.asset(
                                  'assets/categories/Icecreams/pistaice.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Pista\n",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    children: const [
                                      TextSpan(
                                          text: "  ₹ 249",
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
                                .doc('Pista')
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
                                            .doc('Pista')
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
                                            .doc('Pista')
                                            .set(({
                                              'Name': 'Pista',
                                              'price': '₹ 249',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Icecreams/pistaice.jpg',
                                              'path': 'pista',
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
                      Navigator.pushNamed(context, 'vanilla');
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
                                tag: 'assets/categories/Icecreams/vanice.jpg',
                                child: Image.asset(
                                  'assets/categories/Icecreams/vanice.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        Container(
                          child: RichText(
                              text: TextSpan(
                                  text: "Vanilla \n",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500),
                                  children: const <TextSpan>[
                                TextSpan(
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                    children: const [
                                      TextSpan(
                                          text: "  ₹ 157",
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
                                .doc('Vanilla')
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
                                            .doc('Vanilla')
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
                                            .doc('Vanilla')
                                            .set(({
                                              'Name': 'Vanilla',
                                              'price': '₹ 157',
                                              'fav': true,
                                              'image':
                                                  'assets/categories/Icecreams/vanice.jpg',
                                              'path': 'vanilla',
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
