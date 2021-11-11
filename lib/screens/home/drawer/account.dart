import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/wrapper.dart';
import 'package:dairy_products/services/database.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String id = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: colorconst.pcolor, fontSize: 23),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        elevation: 0.0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: Databaseservice(id).details,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.requireData;
              return ListView(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black12,
                    child: Text(
                      data['Name'].toString()[0].toUpperCase(),
                      style: TextStyle(fontSize: 60, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                        child: Text(data['Name'],
                            style: const TextStyle(
                                fontSize: 27,
                                color: Colors.green,
                                fontWeight: FontWeight.w600))),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Details',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.green,
                            fontWeight: FontWeight.w600)),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(Icons.email),
                            title: Text('${id.toString()}')),
                        const Divider(
                          thickness: 1,
                          height: 0.6,
                          color: Colors.black12,
                        ),
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(data['contact'].toString()),
                        ),
                        const Divider(
                          thickness: 1,
                          height: 0.6,
                          color: Colors.black26,
                        ),
                        ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(
                            data['location'],
                            // softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        const Divider(
                          height: 0.6,
                          thickness: 1,
                          color: Colors.black12,
                        ),
                        ListTile(
                          leading: Icon(Icons.people_outline_sharp),
                          title: Text(data['gender']),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      FirebaseAuth.instance.signOut();
                      Navigator.popUntil(context, (route) => false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wrapper()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorconst.scolor.withOpacity(1),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'LOGOUT',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: colorconst.pcolor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          }),
    );
  }
}
