import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mywishlist extends StatefulWidget {
  Mywishlist({Key? key}) : super(key: key);

  @override
  _MywishlistState createState() => _MywishlistState();
}

class _MywishlistState extends State<Mywishlist> {
  @override
  Widget build(BuildContext context) {
    final mail = FirebaseAuth.instance.currentUser!.email.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My WishList',
          style: TextStyle(color: colorconst.pcolor, fontSize: 23),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(mail)
            .collection('wishlist')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length == 0) {
              return Center(
                child: Text('Add some items to your Favorite'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    List docs1 = snapshot.requireData.docs;
                    var doc = docs1[index];
                    return _wishlist(doc.id, doc.data()['price'],
                        doc.data()['image'], doc.data()['path']);
                  });
            }
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return Center(
              child: Text('Add some items to your Favorite'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _wishlist(String name, String price, String image, String path) {
    final mail = FirebaseAuth.instance.currentUser!.email.toString();
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, path);
            },
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    top: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: image,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.3,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      const SizedBox(height: 4),
                      //const SizedBox(height: 8),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.1,
                          color: colorconst.pcolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 85,
              margin: const EdgeInsets.only(right: 0),
              //color: Colors.amber,
            ),
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(mail)
                  .collection('wishlist')
                  .doc(name)
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                              .doc(name)
                              .delete();
                        },
                        icon: Icon(Icons.favorite, color: Colors.red)),
                  );
                } catch (e) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
