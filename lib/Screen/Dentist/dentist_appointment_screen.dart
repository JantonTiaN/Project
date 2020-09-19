import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DentAppointmentScreen extends StatefulWidget {
  // final FirebaseUser user;
  // DentAppointmentScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentAppointmentScreenState createState() => _DentAppointmentScreenState();
}

class _DentAppointmentScreenState extends State<DentAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Dentist Appointmemt Page"),
      ),
    );
  }
}
