import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fundee/models/users.dart';

class PatientDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createPatient(OurPatients patient) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    String retVal = 'error';
    try {
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .setData({
        'fullName': patient.patientFullName,
        'eMail': patient.patientEmail,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
        'role': 'Patient',
        'pathImage':
            'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208',
        'uid': user.uid,
        'clinic': patient.patientClinic
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('AllUsers')
          .document('allUsers')
          .collection('Patients')
          .document(user.uid)
          .setData({
        'fullName': patient.patientFullName,
        'eMail': patient.patientEmail,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
        'role': 'Patient',
        'pathImage':
            'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208',
        'uid': user.uid,
        'clinic': patient.patientClinic
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('DentalCase')
          .document('dentalCase')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('DentalCase')
          .document('dentalCase')
          .collection('CaseDetail')
          .document('caseDetail')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('Appointment')
          .document('appointment')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('History')
          .document('history')
          .collection('OnProgress')
          .document('onProgress')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('History')
          .document('history')
          .collection('Finished')
          .document('finished')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('Suggestion')
          .document('suggestion')
          .setData({});
      userUpdateInfo.displayName = patient.patientFullName;
      userUpdateInfo.photoUrl =
          'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208';
      user.updateProfile(userUpdateInfo);
      user.updateEmail(patient.patientEmail);
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
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(dentist.dentistClinic)
          .document(dentist.dentistClinic)
          .collection('Dentists')
          .document(user.uid)
          .setData({
        'fullName': dentist.dentistFullname,
        'eMail': dentist.dentistEmail,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime,
        'role': 'Dentist',
        'uid': user.uid,
        'clinic': dentist.dentistClinic,
        'pathImage':
            'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208'
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('AllUsers')
          .document('allUsers')
          .collection('Dentists')
          .document(user.uid)
          .setData({
        'fullName': dentist.dentistFullname,
        'eMail': dentist.dentistEmail,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime,
        'role': 'Dentist',
        'uid': user.uid,
        'clinic': dentist.dentistClinic,
        'pathImage':
            'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208'
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(dentist.dentistClinic)
          .document(dentist.dentistClinic)
          .collection('Dentists')
          .document(user.uid)
          .collection('Appointment')
          .document('appointment')
          .setData({});
      userUpdateInfo.photoUrl =
          'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208';
      userUpdateInfo.displayName = dentist.dentistFullname;
      user.updateEmail(dentist.dentistEmail);
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
    String retVal = 'error';

    try {
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(dentist.dentistClinic)
          .document(dentist.dentistClinic)
          .collection('Dentists')
          .document(user.uid)
          .setData({
        'fullName': user.displayName,
        'eMail': user.email,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime,
        'role': 'Dentist',
        'pathImage': user.photoUrl,
        'uid': user.uid,
        'clinic': dentist.dentistClinic,
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(dentist.dentistClinic)
          .document(dentist.dentistClinic)
          .collection('Dentists')
          .document(user.uid)
          .collection('Appointment')
          .document('appointment')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('AllUsers')
          .document('allUsers')
          .collection('Dentists')
          .document(user.uid)
          .setData({
        'fullName': user.displayName,
        'eMail': user.email,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime,
        'role': 'Dentist',
        'pathImage': user.photoUrl,
        'uid': user.uid,
        'clinic': dentist.dentistClinic,
      });
      print(user.photoUrl);
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
    String retVal = 'error';

    try {
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .setData({
        'fullName': user.displayName,
        'eMail': user.email,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
        'role': 'Patient',
        'pathImage': user.photoUrl,
        'uid': user.uid,
        'clinic': patient.patientClinic
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('AllUsers')
          .document('allUsers')
          .collection('Patients')
          .document(user.uid)
          .setData({
        'fullName': user.displayName,
        'eMail': user.email,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
        'role': 'Patient',
        'pathImage': user.photoUrl,
        'uid': user.uid,
        'clinic': patient.patientClinic
      });
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('DentalCase')
          .document('dentalCase')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('DentalCase')
          .document('dentalCase')
          .collection('CaseDetail')
          .document('caseDetail')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('Appointment')
          .document('appointment')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('History')
          .document('history')
          .collection('OnProgress')
          .document('onProgress')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('History')
          .document('history')
          .collection('Finished')
          .document('finished')
          .setData({});
      await _firestore
          .collection('FunD')
          .document('funD')
          .collection('Clinic')
          .document('clinic')
          .collection(patient.patientClinic)
          .document(patient.patientClinic)
          .collection('Patients')
          .document(user.uid)
          .collection('Suggestion')
          .document('suggestion')
          .setData({});
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}

Future<String> dentistWorkingTime(
    List workingTime, String clinic, String uid) async {
  final Firestore _firestore = Firestore.instance;
  String retVal = 'error';
  try {
    await _firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(uid)
        .updateData({'workingTime': workingTime});
    await _firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists')
        .document(uid)
        .updateData({'workingTime': workingTime});
    retVal = 'success';
  } catch (e) {
    print(e);
  }
  return retVal;
}

Future<String> suggestion(List sug, String clinic, String uid) async {
  final Firestore _firestore = Firestore.instance;
  String retVal = 'error';
  try {
    await _firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Patients')
        .document(uid)
        .collection('Suggestion')
        .document('suggestion')
        .updateData({'suggestion': sug});
    retVal = 'success';
  } catch (e) {
    print(e);
  }
  return retVal;
}
