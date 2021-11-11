import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/models/data_model.dart';
import 'package:dairy_products/screens/authenticate/authenticate.dart';
import 'package:dairy_products/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  String? id = FirebaseAuth.instance.currentUser?.email;
  var name;

  // @override
  // void initState() {
  //   super.initState();
  //   Databaseservice(id.toString()).getName(nam, mail).toString();
  // }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  // dynamic mail;
  // Future<String>? nam = null;
  // final Stream<QuerySnapshot> users =
  //     FirebaseFirestore.instance.collection('Users').snapshots();

  Future getUserDetails() async {
    DocumentSnapshot userDetails =
        await _fireStore.collection('Users').doc(id.toString()).get();

    setState(() {
      name = userDetails['Name'];
    });
    print('Name: $name');
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference Users =
        FirebaseFirestore.instance.collection('Users');
    // var res = FirebaseFirestore.instance.collection('Users').doc(id).get();
    // print(res);

    // Future<String> getname(String name) async {
    //   DocumentSnapshot res =
    //       await FirebaseFirestore.instance.collection('Users').doc(id).get();
    //   setState(() {
    //     name = res.get('Name');
    //   });
    //   print(name);
    //   return name;
    // }

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              // Text('Hi , ${name.toString()} '),
              // StreamProvider<DocumentSnapshot>.value(
              //     value: Databaseservice(id.toString()).details,
              //     initialData: Users.doc(id).snapshots() as DocumentSnapshot,
              //     child: Text('Hi, data ')),
              StreamBuilder<DocumentSnapshot>(
                  stream: Databaseservice(id.toString()).details,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return Text('Error');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading');
                    }

                    final data = snapshot.requireData;
                    return Text(
                      'Hi , ${data['Name']} ',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    );
                  }),
              ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.popUntil(context, (route) => false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Authenticate()));
                  Size(150, 150);
                },
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future getUserDetails() async {
  //   DocumentSnapshot userDetails = await _fireStore
  //       .collection('users')
  //       .doc(_auth.currentUser!.email)
  //       .get();
  //   print(_auth.currentUser!.email.toString());
  //   print(userDetails.data());

  //   //List<Map<String, dynamic>> detList = userDetails.get('Name');
  //   //nam = userDetails.get('Name');
  // }
}
