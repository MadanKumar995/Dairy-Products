import 'package:dairy_products/models/user_model.dart';
import 'package:dairy_products/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User? _userfromfirebase(User? user) {
  //   if (user == null) {
  //     return null;
  //   }
  //   return Usermodel(uid: user.uid) as User;
  // }

  //auth change stream

  // Stream<User?>? get user {
  //   return _auth.authStateChanges().map(_userfromfirebase);
  // }

  //create user obj based on firebaseuser
  // User _userfromfirebaseuser(user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  //for anony

  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     //dynamic uid = result.user!.uid;
  //     return User_model(uid: result.user!.uid);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //for email

  Future<User?> signinwithemail(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user!;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register for email

  Future<User?> registerwithemail(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User user = result.user!;

      await Databaseservice(user.email.toString())
          .updateUsername('name', 'mail');

      print(user.email.toString());
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
