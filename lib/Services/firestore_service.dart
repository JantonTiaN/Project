import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/user.dart';

class FirestoreService {
  final CollectionReference _userCollectionRefernce = 
  Firestore.instance.collection('Account');
  
  Future createUser(User user) async {
    try {
      await _userCollectionRefernce.document(user.cID).setData(user.toJson());
    } catch(e){
      return e.message;
    }
  }
} 