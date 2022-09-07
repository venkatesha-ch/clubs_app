import 'package:firebase_auth/firebase_auth.dart';

import './home/Data.dart';

String userEmail;

class Authenticate {
  final FirebaseAuth _fireauth = FirebaseAuth.instance;
  //Authenticate(this._fireauth);

  //Stream<User> get authStateChanges => _fireauth.authStateChanges();

  Future<void> signin(String email, String password) async {
    try {
      userEmail = email;
      Data.email = email;
      await _fireauth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      userEmail = email;
      Data.email = email;

      await _fireauth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("sign up");
    } catch (e) {
      print(e.message);
    }
  }

  // // ignore: missing_return
  // Future<String> isLoggedin() async {
  //   _fireauth.authStateChanges().listen((User user) {
  //     print(user.uid);
  //     return user.uid;
  //   });
  // }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.message);
    }
  }
}
