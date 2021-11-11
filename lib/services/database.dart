import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dairy_products/models/data_model.dart';

class Databaseservice {
  final _fireStore = FirebaseFirestore.instance;
  final String id;
  Databaseservice(this.id);

  final CollectionReference Users =
      FirebaseFirestore.instance.collection('Users');

  // final DocumentReference docu =
  //     FirebaseFirestore.instance.collection('Users').doc();

  Future updateUsername(nam, email) async {
    return await Users.doc(id).set({
      'Name': nam,
      'Email': email,
      'location': 'please update in profile page',
      'contact': 'please update in profile page',
      'gender': 'please select in profile page'
    });
  }

  Future<String>? getName(Future<String>? name, mail) async {
    DocumentSnapshot res = await Users.doc(id).get();
    Future<String> name = res.get('Name');
    mail = res.get('Email');
    print(name);
    return name;
  }

  // Future<String> getUserDetails() async {
  //   DocumentReference userDetails = _fireStore.collection('users').doc(id);
  //   print(userDetails.get());

  //   return userDetails.get().toString();
  // }

  //get Users stream
  Stream<DocumentSnapshot> get details {
    return Users.doc(id).snapshots();
  }

  Stream<QuerySnapshot> get users {
    return Users.snapshots();
  }

  Stream<QuerySnapshot> get cart {
    final CollectionReference cartpage = FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Cartpage');
    return cartpage.snapshots();
  }

  //cart list from snapshot

  // List<cart_model> _brewfromsnap(snapshot) {
  //   return snapshot.docs.map((e) {
  //     return cart_model(
  //         e.data()['img'], e.data()['price'], e.data()['item_count']);
  //   }).toList();
  // }

  // Future<QuerySnapshot<Map<String, dynamic>>> getDetails() {
  //   var result = FirebaseFirestore.instance
  //       .collection('Users')
  //       .where(id, isEqualTo: 'Name')
  //       .get();
  //   print(result.toString());
  //   return result;
  // }

  Future addtocart(String nam, int price, String img) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Cartpage')
        .doc(nam)
        .set(({'price': price, 'cost': price, 'img': img, 'item_count': 1}));
  }

  Future changecost(name, int count, int price) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Cartpage')
        .doc(name)
        .update(({'cost': count * price, 'item_count': count}));
  }

  Future updatetotal(String name, int total) async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .collection('Cartpage')
        .doc(name)
        .update(({'total': total}));
  }
}
