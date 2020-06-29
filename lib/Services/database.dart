import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/models/users.dart';

class OurDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser (OurUser user) async {
    String retVal = 'error';

    try {
      await _firestore.collection('Account').document('account').collection('Users').document(user.email).setData({
        'fullName' : user.fullName,
        'eMail' : user.email,
        'accountCreated' : Timestamp.now(),
        'tel' : user.tel,
        'drugAllergy' : user.drugallergy
      });
      retVal = 'success';
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}