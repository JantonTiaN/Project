import 'package:cloud_firestore/cloud_firestore.dart';
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
          .document(patient.patientEmail)
          .setData({
        'fullName': patient.patientFullName,
        'eMail': patient.patientEmail,
        'birthDay': patient.patientBirthDate,
        'tel': patient.patientTel,
        'drugAllergy': patient.patientDrugallergy,
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
          .document(dentist.dentistEmail)
          .setData({
        'fullName': dentist.dentistFullname,
        'eMail': dentist.dentistEmail,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }
  }
}

class DentistWithFBDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createDentists(OurDentists dentist) async {
    String retVal = 'error';

    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Dentists')
          .document(dentist.dentistEmail)
          .setData({
        // 'fullName' : dentist.dentistFullname,
        // 'eMail' : dentist.dentistEmail,
        'birthDay': dentist.dentistBirthDate,
        'tel': dentist.dentistTel,
        'citizenID': dentist.dentistCitizenID,
        'permission': dentist.dentistPermission,
        'workingTime': dentist.dentistWorkingTime
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }
  }
}
