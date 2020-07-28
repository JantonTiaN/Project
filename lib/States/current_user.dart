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
      _currentUser.patientId = _firebaseUser.uid;
      _currentUser.patientEmail = _firebaseUser.email;
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

  Future<String> signUpDentists(
      String dentistEmail,
      String dentistPassword,
      String dentistFullname,
      String dentistTel,
      String dentistCitizenID,
      String dentistPermission,
      String dentistBirthDate,
      List workingTime()) async {
    String returnVal = 'error';
    OurDentists _dentist = OurDentists();
    try {
      AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
          email: dentistEmail, password: dentistPassword);
      _dentist.dentistID = _authResulf.user.uid;
      _dentist.dentistEmail = _authResulf.user.email;
      _dentist.dentistFullname = dentistFullname;
      _dentist.dentistTel = dentistTel;
      _dentist.dentistCitizenID = dentistCitizenID;
      _dentist.dentistPermission = dentistPermission;
      _dentist.dentistBirthDate = dentistBirthDate;
      _dentist.dentistWorkingTime = workingTime();
      String _returnString = await DentistDatabase().createDentists(_dentist);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> signUpDentistsWithFBAndGG(
      String dentistFullname,
      String dentistTel,
      String dentistCitizenID,
      String dentistPermission,
      String dentistBirthDate,
      List workingTime()) async {
    String returnVal = 'error';
    OurDentists _dentist = OurDentists();
    try {
      // AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
      //     email: dentistEmail, password: dentistPassword);
      // _dentist.dentistID = _authResulf.user.uid;
      // _dentist.dentistEmail = _authResulf.user.email;
      _dentist.dentistFullname = dentistFullname;
      _dentist.dentistTel = dentistTel;
      _dentist.dentistCitizenID = dentistCitizenID;
      _dentist.dentistPermission = dentistPermission;
      _dentist.dentistBirthDate = dentistBirthDate;
      _dentist.dentistWorkingTime = workingTime();
      String _returnString =
          await DentistWithFBAndGGDatabase().createDentists(_dentist);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> signUpPatients(
      String patientEmail,
      String patientPassword,
      String patientFullName,
      String patientTel,
      String patientDrugallergy,
      String patientBirthDate) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      AuthResult _authResulf = await _auth.createUserWithEmailAndPassword(
          email: patientEmail, password: patientPassword);
      _patient.patientId = _authResulf.user.uid;
      _patient.patientEmail = _authResulf.user.email;
      _patient.patientFullName = patientFullName;
      _patient.patientTel = patientTel;
      _patient.patientDrugallergy = patientDrugallergy;
      _patient.patientBirthDate = patientBirthDate;
      String _returnString = await PatientDatabase().createPatient(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> signUpPatientsWithFBAndGG(String patientFullName, String patientTel,
      String patientDrugallergy, String patientBirthDate) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientFullName = patientFullName;
      _patient.patientTel = patientTel;
      _patient.patientDrugallergy = patientDrugallergy;
      _patient.patientBirthDate = patientBirthDate;
      String _returnString = await PatientWithFBAndGGDatabase().createPatient(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } on PlatformException catch (e) {
      returnVal = e.message;
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String returnVal = 'error';

    try {
      AuthResult _authReult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser.patientId = _authReult.user.uid;
      _currentUser.patientEmail = _authReult.user.email;
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

      _currentUser.patientId = _authReult.user.uid;
      _currentUser.patientEmail = _authReult.user.email;
      returnVal = 'success';
    } catch (e) {
      returnVal = e.message;
    }
    return returnVal;
  }
}
