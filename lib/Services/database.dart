import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fundee/models/users.dart';

class PatientDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createPatient(OurPatients patient) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    // AuthCredential credential =
    //     PhoneAuthProvider.getCredential(verificationId: null, smsCode: null);
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .setData({
        'fullName': patient.patientFullName,
        'eMail': patient.patientEmail,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
        'role': 'Patient',
        'pathImage': null
      });
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .setData({});
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .collection('History')
          .document('history')
          .setData({});
      userUpdateInfo.displayName = patient.patientFullName;
      userUpdateInfo.photoUrl = 'assets/images/Logo/App-Icon-drop-shadow.jpg';
      user.updateProfile(userUpdateInfo);
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}

class DentistDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createDentists(OurDentists dentist) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    String retVal = 'error';

    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Dentists')
          .document(dentist.dentistTel)
          .setData({
        'fullName': dentist.dentistFullname,
        'eMail': dentist.dentistEmail,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime,
        'role': 'Dentist',
        'pathImage': null
      });
      userUpdateInfo.displayName = dentist.dentistFullname;
      userUpdateInfo.photoUrl = 'assets/images/Logo/App-Icon-drop-shadow.jpg';
      user.updateProfile(userUpdateInfo);
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}

class DentistWithFBAndGGDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createDentists(OurDentists dentist) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    String retVal = 'error';

    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Dentists')
          .document(dentist.dentistTel)
          .setData({
        'fullName': dentist.dentistFullname,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime,
        'role': 'Dentist',
        'pathImage': null
      });
      userUpdateInfo.displayName = dentist.dentistFullname;
      userUpdateInfo.photoUrl = 'assets/images/Logo/App-Icon-drop-shadow.jpg';
      user.updateProfile(userUpdateInfo);
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}

class PatientWithFBAndGGDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createPatient(OurPatients patient) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    String retVal = 'error';

    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .setData({
        'fullName': patient.patientFullName,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
        'role': 'Patient',
        'pathImage': null
      });
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .setData({});
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .collection('History')
          .document('history')
          .setData({});
      userUpdateInfo.displayName = patient.patientFullName;
      userUpdateInfo.photoUrl = 'assets/images/Logo/App-Icon-drop-shadow.jpg';
      user.updateProfile(userUpdateInfo);
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}

class DentEditProfile {
  final Firestore _firestore = Firestore.instance;
  Future<String> UpdateDentName(OurDentists dentists) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Dentist')
          .getDocuments()
          .then((value) => null);
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}

class Case {
  final Firestore _firestore = Firestore.instance;
  Future<String> addCasetooth1Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 1 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth1Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 1 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth1Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 1 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth2Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 2 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth2Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 2 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth2Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 2 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth3Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 3 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth3Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 3 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth3Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 3 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth4Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 4 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth4Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 4 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth4Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 4 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth5Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 5 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth5Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 5 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth5Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 5 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth6Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 6 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth6Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 6 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth6Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 6 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth7Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 7 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth7Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 7 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth7Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 7 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth8Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 8 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth8Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 8 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth8Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 8 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth9Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 9 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth9Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 9 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth9Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 9 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth10Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 10 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth10Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 10 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth10Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 10 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth11Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 11 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth11Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 11 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth11Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 11 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth12Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 12 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth12Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 12 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth12Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 12 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth13Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 13 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth13Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 13 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth13Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 13 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth14Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 14 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth14Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 14 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth14Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 14 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth15Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 15 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth15Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 15 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth15Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 15 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth16Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 16 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth16Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 16 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth16Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 16 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth17Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 17 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth17Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 17 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth17Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 17 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth18Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 18 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth18Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 18 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth18Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 18 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth19Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 19 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth19Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 19 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth19Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 19 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth20Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 20 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth20Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 20 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth20Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 20 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth21Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 21 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth21Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 21 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth21Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 21 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth22Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 22 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth22Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 22 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth22Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 22 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth23Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 23 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth23Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 23 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth23Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 23 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth24Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 24 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth24Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 24 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth24Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 24 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth25Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 25 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth25Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 25 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth25Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 25 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth26Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 26 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth26Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 26 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth26Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 26 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth27Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 27 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth27Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 27 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth27Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 27 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth28Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 28 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth28Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 28 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth28Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 28 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth29Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 29 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth29Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 29 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth29Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 29 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth30Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 30 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth30Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 30 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth30Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 30 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth31Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 31 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth31Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 31 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth31Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 31 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth32Front(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 32 Front': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth32Back(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 32 Back': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth32Middle(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 32 Middle': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
