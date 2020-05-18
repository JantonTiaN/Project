import 'package:flutter/material.dart';

class User {
  final String cID;
  final String fname;
  final String lname;
  final String gender;
  final String tel;
  final String drugallergy;
  final String email;
  final String address;

  User({this.cID, this.fname, this.lname, this.gender, this.tel, this.drugallergy, this.email, this.address});

  User.fromData(Map<String, dynamic> data)
  : cID = data['cID'], 
    fname = data['fname'],
    lname = data['lname'],
    gender = data['gender'],
    tel = data['tel'],
    drugallergy = data['drugallergy'],
    email = data['email'],
    address = data['address'];

  Map<String, dynamic> toJson(){
    return{
      'cID' : cID,
      'fname' : fname,
      'lname' : lname,
      'gender' : gender,
      'tel' : tel,
      'drugallergy' : drugallergy,
      'email' : email,
      'address' : address,
    };
  }
}