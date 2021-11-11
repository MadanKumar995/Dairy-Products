import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/home/cartlist.dart';
import 'package:dairy_products/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  String? id = FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String mail = id.toString();
    return StreamBuilder<QuerySnapshot>(
        stream: Databaseservice(mail).cart,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            body: Cartlist(),
          );
        });
  }

  cartitem(
    String img,
    String name,
    int count,
    int cost,
  ) {
    return Row(
      children: [
        Container(
          // margin: const EdgeInsets.only(
          //   left: 23,
          //   top: 15,
          //   right: 10,
          //   bottom: 15,
          // ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),

            // child: Image.asset(
            //   img,
            //   fit: BoxFit.cover,
            // ),
          ),
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.3,
                    color: Colors.black,
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
                        setState(() {
                          count--;
                        });
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
                          count++;
                        });
                      },
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 10,
            margin: const EdgeInsets.only(right: 0),
            color: Colors.black,
          ),
        ),
        Container(
            margin: EdgeInsets.only(right: 30),
            child: Text(
              '\$ ${cost * count}',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Cookie',
              ),
            )),
      ],
    );
  }
}
