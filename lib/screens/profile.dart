import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/screens/authenticate/authenticate.dart';
import 'package:dairy_products/services/database.dart';
import 'package:dairy_products/values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool edit = false;
  String? name;
  int gen_value = 1;
  String? contact;
  num? n;
  String? location;
  String? gender;
  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser!.email.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: colorconst.pcolor, fontSize: 23),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.green),
        leading: Visibility(
          visible: edit,
          child: IconButton(
              onPressed: () {
                setState(() {
                  edit = !edit;
                });
              },
              icon: Icon(Icons.arrow_back)),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: Databaseservice(id).details,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.requireData;
              return ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black12,
                    child: Text(
                      data['Name'].toString()[0].toUpperCase(),
                      style: TextStyle(fontSize: 60, color: colorconst.pcolor),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      data['Name'].toString().toUpperCase(),
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: colorconst.pcolor),
                    ),
                  ),
                  Visibility(
                    visible: !edit,
                    child: Card(
                      elevation: 0.0,
                      child: ListTile(
                        trailing: InkWell(
                            onTap: () {
                              setState(() {
                                edit = !edit;
                                print(edit);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.edit_outlined,
                                color: colorconst.pcolor,
                              ),
                            )),
                        leading: Icon(
                          Icons.arrow_right_alt,
                          color: colorconst.pcolor,
                        ),
                        title: const Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: edit,
                    child: Card(
                      elevation: 0.0,
                      child: ListTile(
                        leading: Icon(
                          Icons.arrow_right_alt,
                          color: colorconst.pcolor,
                        ),
                        title: const Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: edit ? 0 : 1,
                    duration: Duration(milliseconds: 270) * 4,
                    child: Visibility(
                      visible: !edit,
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.person_outline_outlined,
                                color: Colors.green,
                              ),
                              title: Text(
                                data['Name'].toString(),
                                style: TextStyle(
                                  color: colorconst.pcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Divider(
                              height: 0.6,
                              color: Colors.black26,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.mail_outline,
                                color: Colors.green,
                              ),
                              title: Text(
                                data['Email'].toString(),
                                style: TextStyle(
                                  color: colorconst.pcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Divider(
                              height: 0.6,
                              color: Colors.black26,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.phone_outlined,
                                color: Colors.green,
                              ),
                              title: Text(
                                data['contact'].toString(),
                                style: TextStyle(
                                  color: colorconst.pcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Divider(
                              height: 0.6,
                              color: Colors.black26,
                            ),
                            ListTile(
                              leading: data['gender'] == 'Male'
                                  ? const Icon(
                                      Icons.male,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.female,
                                      color: Colors.green,
                                    ),
                              title: Text(
                                data['gender'].toString(),
                                style: TextStyle(
                                  color: colorconst.pcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Divider(
                              height: 0.6,
                              color: Colors.black26,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.place_outlined,
                                color: Colors.green,
                              ),
                              title: Text(
                                data['location'].toString(),
                                style: TextStyle(
                                  color: colorconst.pcolor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: edit ? 1 : 0,
                    duration: Duration(milliseconds: 270) * 4,
                    child: Visibility(
                        visible: edit,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 2),
                                      child: TextFormField(
                                        onChanged: (val) async {
                                          name = val;
                                        },
                                        cursorColor: Colors.cyan,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                            letterSpacing: 1.3),
                                        decoration: InputDecoration(
                                          icon: const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.emoji_emotions_outlined,
                                              color: Colors.green,
                                            ),
                                          ),
                                          hintText: 'Name',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: colorconst.pcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      height: 0.6,
                                      color: Colors.black26,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.mail_outline,
                                          color: Colors.green,
                                        ),
                                        title: Text(
                                          data['Email'].toString(),
                                          style: TextStyle(
                                            color: colorconst.pcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: Text(
                                          'Email can\'t be edited',
                                          style: TextStyle(
                                            color: colorconst.pcolor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      height: 0.6,
                                      color: Colors.black26,
                                    ),
                                    ListTile(
                                      leading: const Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 15),
                                        child: Icon(
                                          Icons.people_alt_outlined,
                                          color: Colors.green,
                                        ),
                                      ),
                                      title: DropdownButton(
                                        isExpanded: true,
                                        value: gen_value,
                                        iconSize: 15,
                                        items: [
                                          DropdownMenuItem(
                                            child: Text(
                                              'Male',
                                              style: TextStyle(
                                                color: colorconst.pcolor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                              'Female',
                                              style: TextStyle(
                                                color: colorconst.pcolor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            value: 2,
                                          ),
                                        ],
                                        onChanged: (val) {
                                          setState(() {
                                            gen_value = val as int;
                                          });
                                        },
                                      ),
                                    ),
                                    const Divider(
                                      height: 0.6,
                                      color: Colors.black26,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 2),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        cursorColor: Colors.cyan,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                            letterSpacing: 1.3),
                                        decoration: InputDecoration(
                                          icon: const Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: Icon(
                                              Icons.phone_outlined,
                                              color: Colors.green,
                                            ),
                                          ),
                                          hintText: 'Contact Number',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: colorconst.pcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onChanged: (val) async {
                                          contact = val;
                                        },
                                      ),
                                    ),
                                    const Divider(
                                      height: 0.6,
                                      color: Colors.black26,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 2),
                                      child: TextFormField(
                                        onChanged: (val) {
                                          location = val;
                                        },
                                        cursorColor: Colors.cyan,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                            letterSpacing: 1.3),
                                        decoration: InputDecoration(
                                          icon: Padding(
                                            padding: EdgeInsets.only(right: 15),
                                            child: InkWell(
                                              onTap: () {
                                                //navigator
                                              },
                                              onLongPress: () {
                                                Fluttertoast.showToast(
                                                    msg: 'Location');
                                              },
                                              child: const Icon(
                                                Icons.place_outlined,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          hintText: 'Location',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                            color: colorconst.pcolor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              InkWell(
                                onTap: () async {
                                  num? numberValidator(String? value) {
                                    if (value == null) {
                                      return 0;
                                    }
                                    final n1 = num.tryParse(value);
                                    // if (n == null) {
                                    //   return 1;
                                    // }
                                    return n1;
                                  }

                                  n = numberValidator(contact);

                                  print(n!.toInt().bitLength);
                                  bool temp = (n.toString().startsWith('9')) ||
                                      (n.toString().startsWith('8')) ||
                                      (n.toString().startsWith('7')) ||
                                      (n.toString().startsWith('6'));

                                  if (gen_value == 1) {
                                    gender = 'Male';
                                  } else {
                                    gender = 'Female';
                                  }
                                  if (name != null &&
                                      n!.toInt().bitLength >= 31 &&
                                      n!.toInt().bitLength <= 34 &&
                                      name!.length >= 3 &&
                                      location!.length >= 4 &&
                                      temp) {
                                    await FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(id)
                                        .update(({
                                          'Name': name,
                                          'gender': gender,
                                          'contact': n,
                                          'location': location,
                                        }));
                                    setState(() {
                                      edit = !edit;
                                    });
                                    Fluttertoast.showToast(
                                        msg: 'Details Updated');
                                  } else if (name == null ||
                                      contact == null ||
                                      location == null ||
                                      location!.length <= 3 ||
                                      name!.length <= 3) {
                                    Fluttertoast.showToast(
                                        msg: 'Please Fill all Fields');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg:
                                            'Please Enter Valid Contact Number');
                                  }
                                },
                                child: Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 30),
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: colorconst.scolor.withOpacity(1),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 70, vertical: 13),
                                    child: Text(
                                      'SUBMIT',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              );
            }
            return Container();
          }),
    );
  }
}
