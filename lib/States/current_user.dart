import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Services/database.dart';
import 'package:fundee/models/users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  OurUser _currentUser;

  OurUser get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartUp() async {
    String returnVal = 'error';

    try {
      FirebaseUser _firebaseUser = await _auth.currentUser();
      _currentUser.uid = _firebaseUser.uid;
      _currentUser.email = _firebaseUser.email;
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> signOut() async {
    String returnVal = 'error';

    try {
      await _auth.signOut();
      _currentUser = null;
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> signUpPatient(String email, String password, String fullName) async {
    String returnVal = 'error';
    OurUser _user = OurUser();
    try {
      AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResulf.user.uid;
      _user.email = _authResulf.user.email;
      _user.fullName = fullName;
      String _returnString = await OurDatabase().createUser(_user);
      if(_returnString == 'success'){
        returnVal = 'success';
      }
      returnVal = 'success';
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e){
      print(e);
    }
    return returnVal;
  }

    Future<String> signUpDentist(String email, String password, String fullName) async {
    String returnVal = 'error';
    OurUser _user = OurUser();
    try {
      AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResulf.user.uid;
      _user.email = _authResulf.user.email;
      _user.fullName = fullName;
      String _returnString = await OurDatabase().createUser(_user);
      if(_returnString == 'success'){
        returnVal = 'success';
      }
      returnVal = 'success';
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e){
      print(e);
    }
    return returnVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String returnVal = 'error';

    try {
      AuthResult _authReult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser.uid = _authReult.user.uid;
      _currentUser.email = _authReult.user.email;
      returnVal = 'success';
    } catch (e) {
      returnVal = e.message;
    }
    return returnVal;
  }

  Future<String> loginUserWithGoogle() async {
    String returnVal = 'error';
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      AuthResult _authReult = await _auth.signInWithCredential(credential);

      _currentUser.uid = _authReult.user.uid;
      _currentUser.email = _authReult.user.email;
      returnVal = 'success';
    } catch (e) {
      returnVal = e.message;
    }
    return returnVal;
  }
}
