import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/home/paymentdone.dart';
import 'package:dairy_products/screens/home/paymentfail.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Confirm extends StatefulWidget {
  Confirm({Key? key}) : super(key: key);

  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  final mail = FirebaseAuth.instance.currentUser!.email.toString();
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Order Confirmaton',
          style:
              TextStyle(color: colorconst.pcolor, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: colorconst.pcolor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is just a test Version of this app',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text('You can choose your order to be Placed or',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          Text('Decline',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(mail)
                      .collection('Cartpage')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dateid =
                          DateFormat('dd/MM/yy kk:mm').format(date).toString();
                      return ElevatedButton(
                        onPressed: () {
                          List data = snapshot.requireData.docs;
                          var it = 0;
                          for (var i in data) {
                            it += 1;
                            FirebaseFirestore.instance
                                .collection('Users')
                                .doc(mail)
                                .collection('orders')
                                .doc(date.toString())
                                .set(({
                                  'Name': i.id,
                                  'item_count': i['item_count'],
                                  'total': i['total'],
                                  'total_count': it,
                                  'status': 'Order Placed',
                                  'date': dateid,
                                }));
                          }
                          for (var i in data) {
                            FirebaseFirestore.instance
                                .collection('Users')
                                .doc(mail)
                                .collection('Cartpage')
                                .doc(i.id)
                                .delete();
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentDone()));
                        },
                        child: Text('Place Order'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(mail)
                      .collection('Cartpage')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dateid =
                          DateFormat('dd/MM/yy kk:mm').format(date).toString();
                      return ElevatedButton(
                        onPressed: () {
                          List data = snapshot.requireData.docs;
                          var it = 0;
                          for (var i in data) {
                            it += 1;
                            FirebaseFirestore.instance
                                .collection('Users')
                                .doc(mail)
                                .collection('orders')
                                .doc(date.toString())
                                .set(({
                                  'Name': i.id,
                                  'item_count': i['item_count'],
                                  'total': i['total'],
                                  'total_count': it,
                                  'status': 'Failed',
                                  'date': dateid,
                                }));
                          }
                          for (var i in data) {
                            FirebaseFirestore.instance
                                .collection('Users')
                                .doc(mail)
                                .collection('Cartpage')
                                .doc(i.id)
                                .delete();
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Paymentfail()));
                        },
                        child: Text('Decline Order'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                      );
                    } else if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          )
        ],
      ),
    );
  }
}
