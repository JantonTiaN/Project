import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Services/database.dart';
import 'package:fundee/models/users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  OurPatients _currentUser;

  OurPatients get getCurrentUser => _currentUser;

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

  // Future<String> signUpDentists(String email, String password, String fullName, String tel, String drugallergy, String birthDate) async {
  //   String returnVal = 'error';
  //   OurPatients _user = OurPatients();
  //   try {
  //     AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     _user.uid = _authResulf.user.uid;
  //     _user.email = _authResulf.user.email;
  //     _user.fullName = fullName;
  //     _user.tel = tel;
  //     _user.drugallergy = drugallergy;
  //     _user.birthDate = birthDate;
  //     String _returnString = await OurDatabase().createUser(_user);
  //     if(_returnString == 'success'){
  //       returnVal = 'success';
  //     }
  //     returnVal = 'success';
  //   } on PlatformException catch (e) {
  //     returnVal = e.message;
  //   } catch (e){
  //     print(e);
  //   }
  //   return returnVal;
  // }

  Future<String> signUpPatients(String email, String password, String fullName, String tel, String drugallergy, String birthDate) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _patient.uid = _authResulf.user.uid;
      _patient.email = _authResulf.user.email;
      _patient.fullName = fullName;
      _patient.tel = tel;
      _patient.drugallergy = drugallergy;
      _patient.birthDate = birthDate;
      String _returnString = await OurDatabase().createUser(_patient);
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
