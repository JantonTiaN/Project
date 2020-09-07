import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/models/dental_case.dart';
import 'package:fundee/models/users.dart';

class PatientDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createPatient(OurPatients patient) async {
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
        'case': null,
        'role': 'Pateint'
      });
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
        'role': 'Dentist'
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }
  }
}

class DentistWithFBAndGGDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createDentists(OurDentists dentist) async {
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
        'role': 'Dentist'
      });

      retVal = 'success';
    } catch (e) {
      print(e);
    }
  }
}

class PatientWithFBAndGGDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createPatient(OurPatients patient) async {
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
        'case': null,
        'role': 'Patient'
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}

class Case {
  final Firestore _firestore = Firestore.instance;

  Future<String> addCase(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth ' + cases.toothNo: cases.patientCase});
      // .setData({'tooth ' + cases.toothNo: cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
