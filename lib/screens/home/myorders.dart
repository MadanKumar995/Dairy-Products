import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myorders extends StatefulWidget {
  Myorders({Key? key}) : super(key: key);

  @override
  _MyordersState createState() => _MyordersState();
}

class _MyordersState extends State<Myorders> {
  final mail = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders History',
          style: TextStyle(
              color: colorconst.pcolor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: colorconst.pcolor),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(mail)
              .collection('orders')
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.docs.length == 0) {
                return Center(
                  child: Text('No recent Orders\nBuy some products now'),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      List docs1 = snapshot.requireData.docs;
                      var doc = docs1[index];
                      return _orderitem(
                          doc.id.toString(),
                          doc.data()['date'],
                          doc.data()['status'],
                          doc.data()['total_count'],
                          doc.data()['Name'],
                          doc.data()['total'].toString(),
                          doc.data()['item_count'].toString());
                    });
              }
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No recent Orders\nBuy some products now'),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error while Loading'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  _orderitem(String ordid, String date, String status, num total_count,
      String name, String total, String item_count) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: [
            Text(
              'OrderID: $ordid',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13, top: 5),
                  child: Text(
                    'Transaction done at: $date',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorconst.pcolor, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13, top: 10, bottom: 5),
                  child: Text(
                    'Order Status: $status',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorconst.pcolor, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13, top: 10, right: 10, bottom: 10),
                  child: Text(
                    'Total Items: $total_count',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorconst.pcolor, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: RichText(
                      text: TextSpan(
                          text: 'Items: ',
                          style: TextStyle(
                              color: colorconst.pcolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          children: [
                        TextSpan(text: '$name x $item_count', children: [
                          TextSpan(
                              text: '\n                 .',
                              style: TextStyle(
                                  color: colorconst.pcolor,
                                  fontWeight: FontWeight.w900),
                              children: [
                                TextSpan(text: '\n                 .'),
                              ]),
                        ])
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: Text(
                    'Total Amount: ₹ $total',
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
