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
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .setData({});
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
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(patient.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .setData({});
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
          .setData({'tooth ' + cases.toothNo: cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth1(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 1': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth2(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          // .updateData({'tooth ' + cases.toothNo: cases.patientCase});
          .updateData({'tooth 2': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth3(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 3': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth4(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 4': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth5(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 5': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth6(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 6': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth7(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 7': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth8(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 8': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth9(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 9': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth10(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 10': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth11(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 11': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth12(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 12': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth13(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 13': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth14(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 14': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth15(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 15': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth16(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 16': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth17(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 17': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth18(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 18': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth19(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 19': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth20(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 20': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth21(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 21': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth22(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 22': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth23(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 23': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth24(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 24': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth25(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 25': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth26(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 26': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth27(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 27': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth28(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 28': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth29(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 29': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth30(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 30': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth31(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 31': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String> addCasetooth32(OurPatients cases) async {
    String retVal = 'error';
    try {
      await _firestore
          .collection('Account')
          .document('account')
          .collection('Patients')
          .document(cases.patientTel)
          .collection('DentalCase')
          .document('dentalCase')
          .updateData({'tooth 32': cases.patientCase});
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
