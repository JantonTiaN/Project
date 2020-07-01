import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/models/users.dart';

class OurDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser (OurPatients patient) async {
    String retVal = 'error';

    try {
      await _firestore.collection('Account').document('account').collection('Users').document(patient.email).setData({
        'fullName' : patient.fullName,
        'eMail' : patient.email,
        'birthDay' : patient.birthDate,
        'tel' : patient.tel,
        'drugAllergy' : patient.drugallergy,
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}