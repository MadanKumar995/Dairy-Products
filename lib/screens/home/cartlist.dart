import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/home/checkout.dart';
import 'package:dairy_products/services/database.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cartlist extends StatefulWidget {
  Cartlist({Key? key}) : super(key: key);

  @override
  _CartlistState createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  String mail = FirebaseAuth.instance.currentUser!.email.toString();
  bool ispaynow = false;
  bool details = false;
  num numb = 0;
  num deliverycharge = 40;
  @override
  Widget build(BuildContext context) {
    var lst = [];
    return Scaffold(
      appBar: AppBar(
        title: ispaynow
            ? Text(
                'Checkout',
                style: TextStyle(color: colorconst.pcolor),
              )
            : Text(
                'Cart Page',
                style: TextStyle(color: colorconst.pcolor),
              ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorconst.pcolor),
      ),
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: ispaynow ? 0 : 1,
            duration: Duration(milliseconds: 270) * 2,
            child: StreamBuilder<QuerySnapshot>(
                stream: Databaseservice(mail).cart,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.length == 0) {
                      return Center(
                        child: Text(
                          'Your Cart is Empty',
                          style: TextStyle(
                              fontSize: 24,
                              color: colorconst.pcolor,
                              fontWeight: FontWeight.w600),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            List docs1 = snapshot.requireData.docs;
                            var doc = docs1[index];
                            lst.add(doc.data()['cost']);
                            return cartitem(
                              doc.data()['img'] ?? '',
                              doc.id,
                              doc.data()['item_count'] ?? 0,
                              doc.data()['price'] ?? 0,
                            );
                          });
                    }
                  } else if (snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasData) {
                    // paynow = false;
                    return const Center(
                      child: Text("Your Cart is Empty"),
                    );
                  } else {
                    // paynow = false;
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Visibility(
            visible: !ispaynow,
            child: StreamBuilder<QuerySnapshot>(
                stream: Databaseservice(mail).cart,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData &&
                      snapshot.requireData.docs.length != 0) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            int sum = 0;
                            List docs1 = snapshot.requireData.docs;
                            for (var i in docs1) {
                              // print(i['cost']);
                              sum = sum + (i['cost'] as int);
                              // print(sum);
                            }
                            for (var i in docs1) {
                              Databaseservice(mail).updatetotal(i.id, sum);
                            }

                            numb = sum;
                            setState(() {
                              ispaynow = !ispaynow;
                            });
                          },
                          child: Hero(
                            tag: 'checkout_paynow',
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green.shade300.withOpacity(1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: colorconst.pcolor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData == false) {
                    return Center(
                      child: Text('Please Wait'),
                    );
                  } else {
                    return Center(
                      child: Container(),
                    );
                  }
                }),
          ),

          //pay

          AnimatedOpacity(
              opacity: ispaynow ? 1 : 0,
              duration: Duration(milliseconds: 270) * 4,
              child: Visibility(
                visible: ispaynow,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Items',
                        style:
                            TextStyle(fontSize: 23, color: colorconst.pcolor),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        color: Colors.white24,
                        elevation: 0,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: Databaseservice(mail).cart,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, index) {
                                      List docs1 = snapshot.requireData.docs;
                                      var doc = docs1[index];

                                      return ListTile(
                                        leading: Text(
                                          doc.id,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green),
                                        ),
                                        title: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Text(
                                            'x ${doc.data()['item_count'].toString()}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green),
                                          ),
                                        ),
                                        trailing: Text(
                                          '₹ ${doc.data()['cost'].toString()}',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w600,
                                              color: colorconst.pcolor),
                                        ),
                                      );
                                    });
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (!snapshot.hasData) {
                                return const Center(
                                  child: Text('Wait'),
                                );
                              } else {
                                return const Center(
                                  child: Text('Error'),
                                );
                              }
                            }),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: details ? 0 : 1,
                      duration: Duration(milliseconds: 270) * 2,
                      child: Visibility(
                        visible: !details,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              details = !details;
                            });
                          },
                          child: Column(
                            children: [
                              Visibility(
                                  visible: !details,
                                  child:
                                      Icon(Icons.keyboard_arrow_up_outlined)),
                              Text(
                                'Details',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: details ? 1 : 0,
                      duration: Duration(milliseconds: 270) * 4,
                      child: Visibility(
                        visible: details,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              details = !details;
                            });
                          },
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: details,
                      child: Card(
                        color: Color.fromRGBO(217, 217, 217, 0.4),
                        elevation: 0,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text(
                                'SubTotal',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: colorconst.pcolor),
                              ),
                              trailing: Text(
                                '₹ ${numb.toString()}',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: colorconst.pcolor),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                'Delivery Charges',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: colorconst.pcolor),
                              ),
                              trailing: Text(
                                '₹ 40',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: colorconst.pcolor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: ispaynow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Checkout(total: numb)));
                            },
                            child: Hero(
                              tag: 'checkout_paynow',
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green.shade300.withOpacity(1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  child: Text(
                                    'Pay now',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: colorconst.pcolor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          StreamBuilder(
                              stream: Databaseservice(mail).cart,
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  // print(docs1);
                                  return Center(
                                    child: Text(
                                      'Total : ₹ ${(numb + deliverycharge).toString()}',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w600,
                                        color: colorconst.pcolor,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    !snapshot.hasData) {
                                  return const Center(
                                    child: Text("No Records found."),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  );
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  cartitem(
    String img,
    String name,
    int count,
    int price,
  ) {
    String id = FirebaseAuth.instance.currentUser!.email.toString();
    int temp_count = count;

    return Card(
      child: Row(
        children: [
          InkWell(
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(id)
                    .collection('Cartpage')
                    .doc(name)
                    .delete();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Icon(Icons.close))),
          Container(
            margin: const EdgeInsets.only(
              // left: 23,
              top: 5,
              // right: 10,
              bottom: 5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Hero(
                tag: img,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text(
                    name,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3,
                      color: colorconst.pcolor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 5),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.black, width: 0.1),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (temp_count == 0) {
                          } else {
                            setState(() {
                              temp_count--;
                              // sum -= (count * price);
                            });
                            if (temp_count == 0) {
                              FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(id)
                                  .collection('Cartpage')
                                  .doc(name)
                                  .delete();
                            } else {
                              Databaseservice(id)
                                  .changecost(name, count - 1, price);
                            }
                          }
                        },
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$count',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        //color: Colors.greenAccent.shade700,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.black, width: 0.1),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            temp_count++;
                            // sum += (count * price);
                          });
                          Databaseservice(id)
                              .changecost(name, count + 1, price);
                        },
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          '₹ ${price * count}',
                          style: const TextStyle(
                              fontSize: 23, color: Colors.green),
                        )),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.green,
              height: 10,
              margin: const EdgeInsets.only(right: 0),
            ),
          ),
        ],
      ),
    );
  }
}
