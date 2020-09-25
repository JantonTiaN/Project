import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientHomeScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHomeScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHomeScreenState createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('This is Patient Home Screen')));
  }
}
