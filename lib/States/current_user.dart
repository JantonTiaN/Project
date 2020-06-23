import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _userid;
  String _email;

  String get getUserid => _userid;
  String get getUseremail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    String returnVal = 'error';

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      returnVal = 'success';
    } catch (e) {
      returnVal = e.message;
    }
    return returnVal;
  }

  Future<String> loginUser(String email, String password) async {
    String returnVal = 'error';

    try {
      AuthResult _authReult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _userid = _authReult.user.uid;
      _email = _authReult.user.email;
      returnVal = 'success';
    } catch (e) {
      returnVal = e.message;
    }
    return returnVal;
  }
}
