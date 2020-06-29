import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String fullName;
  String tel;
  String drugallergy;
  Timestamp accountCreated;

  OurUser({
    this.uid,
    this.email,
    this.fullName,
    this.tel,
    this.drugallergy,
    this.accountCreated,
  });
}