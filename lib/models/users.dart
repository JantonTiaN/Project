import 'package:cloud_firestore/cloud_firestore.dart';

class OurPatients {
  String uid;
  String email;
  String fullName;
  String tel;
  String drugallergy;
  String birthDate;

  OurPatients({
    this.uid,
    this.email,
    this.fullName,
    this.tel,
    this.drugallergy,
    this.birthDate,
  });
}

class OurDentists {

}