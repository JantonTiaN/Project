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

  Future<String> signUpPatientsWithFBAndGG(
      String patientFullName,
      String patientTel,
      String patientDrugallergy,
      String patientBirthDate) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientFullName = patientFullName;
      _patient.patientTel = patientTel;
      _patient.patientDrugallergy = patientDrugallergy;
      _patient.patientBirthDate = patientBirthDate;
      String _returnString =
          await PatientWithFBAndGGDatabase().createPatient(_patient);
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

  // Future<String> addDentalCase(List dentalCase(), String docID) async {
  //   String returnVal = 'error';
  //   OurPatients _patient = OurPatients();
  //   try {
  //     _patient.patientCase = dentalCase();
  //     _patient.patientTel = docID;
  //     String _returnString = await Case().addCase(_patient);
  //     if (_returnString == 'success') {
  //       returnVal = 'success';
  //     }
  //     returnVal = 'success';
  //   } catch (e) {
  //     print(e);
  //   }
  //   return returnVal;
  // }

  Future<String> addDentalCase1Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth1Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase1Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth1Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase1Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth1Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase2Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth2Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase2Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth2Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase2Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth2Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase3Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth3Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase3Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth3Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase3Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth3Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase4Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth4Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase4Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth4Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase4Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth4Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase5Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth5Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase5Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth5Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase5Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth5Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase6Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth6Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase6Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth6Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase6Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth6Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase7Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth7Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase7Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth7Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase7Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth7Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase8Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth8Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase8Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth8Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase8Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth8Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase9Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth9Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase9Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth9Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase9Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth9Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase10Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth10Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase10Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth10Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase10Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth10Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase11Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth11Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase11Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth11Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase11Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth11Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase12Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth12Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase12Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth12Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase12Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth12Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase13Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth13Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase13Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth13Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase13Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth13Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase14Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth14Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase14Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth14Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase14Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth14Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase15Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth15Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase15Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth15Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase15Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth15Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase16Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth16Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase16Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth16Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase16Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth16Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase17Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth17Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase17Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth17Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase17Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth17Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase18Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth18Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase18Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth18Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase18Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth18Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase19Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth19Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase19Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth19Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase19Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth19Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase20Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth20Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase20Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth20Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase20Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth20Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase21Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth21Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase21Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth21Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase21Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth21Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase22Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth22Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase22Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth22Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase22Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth22Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase23Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth23Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase23Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth23Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase23Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth23Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase24Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth24Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase24Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth24Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase24Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth24Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase25Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth25Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase25Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth25Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase25Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth25Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase26Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth26Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase26Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth6Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase26Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth26Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase27Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth27Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase27Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth27Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase27Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth27Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase28Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth28Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase28Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth28Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase28Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth28Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase29Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth29Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase29Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth29Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase29Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth29Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase30Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth30Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase30Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth30Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase30Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth30Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase31Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth31Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase31Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth31Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase31Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth31Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase32Front(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth32Front(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase32Back(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth32Back(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }

  Future<String> addDentalCase32Middle(List dentalCase(), String docID) async {
    String returnVal = 'error';
    OurPatients _patient = OurPatients();
    try {
      _patient.patientCase = dentalCase();
      _patient.patientTel = docID;
      String _returnString = await Case().addCasetooth32Middle(_patient);
      if (_returnString == 'success') {
        returnVal = 'success';
      }
      returnVal = 'success';
    } catch (e) {
      print(e);
    }
    return returnVal;
  }
}
