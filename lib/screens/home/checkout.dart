import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/home/confirmorder.dart';
import 'package:dairy_products/screens/home/paymentdone.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  Checkout({Key? key, required this.total}) : super(key: key);
  num total;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController _couponlControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isedit = false;
    final mail = FirebaseAuth.instance.currentUser!.email.toString();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Checkout",
          style: TextStyle(
            color: colorconst.pcolor,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: colorconst.pcolor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Shipping Address",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: colorconst.pcolor),
                ),
              ),
              // Visibility(
              //   visible: !isedit,
              //   child: IconButton(
              //     onPressed: () {
              //       isedit = !isedit;
              //     },
              //     icon: Icon(
              //       Icons.edit,
              //       color: Colors.green,
              //     ),
              //   ),
              // ),
            ],
          ),
          // SizedBox(height: 10.0),
          StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(mail)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.requireData;
                  return ListTile(
                    title: Text(
                      data.get('Name'),
                      style: TextStyle(
                        //fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Text(data.get('location')),
                  );
                } else if (snapshot.hasError || !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          SizedBox(height: 10.0),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Payment Method",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              elevation: 4.0,
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(mail)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.requireData;
                      return ListTile(
                        title: Text(
                          data.get('Name'),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "0XXX XXXX XXXX XXXX",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        leading: Icon(
                          Icons.credit_card,
                          size: 50.0,
                          color: Colors.deepPurple,
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.hasError) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
      bottomSheet: Card(
        elevation: 4.0,
        child: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Coupon Code",
                      prefixIcon: Icon(
                        Icons.redeem,
                        color: Theme.of(context).accentColor,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 1,
                    controller: _couponlControl,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          (widget.total + 40).toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        Text(
                          "Delivery charges included",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                    width: 150.0,
                    height: 50.0,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      child: Text(
                        "Place Order".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Confirm()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 130,
        ),
      ),
    );
  }
}

Widget _sellings(
    String image, String name, String description, String mvp, String dp) {
  return Container(
    margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
    height: 115,
    //width: 350,
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 23,
            top: 15,
            right: 10,
            bottom: 15,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Cookie',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Cookie',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              //const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                    text: mvp,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.1,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: '  $dp',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.3,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ]),
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
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.red)),
      ],
    ),

    decoration: BoxDecoration(
      color: Colors.grey.shade400.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
