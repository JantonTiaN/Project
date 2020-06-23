import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier{
  String _userid;
  String _email;

  String get getUserid => _userid;
  String get getUseremail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async{
    bool returnVal = false;

    try{
      AuthResult _authReult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(_authReult.user != null){
        returnVal = true;
      }
    } catch (e){
      print(e);
    }
    return returnVal;
  }

  Future<bool> loginUser(String email, String password) async{
    bool returnVal = false;

    try{
      AuthResult _authReult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(_authReult.user != null){
        _userid = _authReult.user.uid;
        _email = _authReult.user.email;
        returnVal = true;
      }
    } catch (e){
      print(e);
    }
    return returnVal;
  }
}