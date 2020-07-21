import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DentProfileScreen extends StatefulWidget {
  // final FirebaseUser user;
  // DentProfileScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentProfileScreenState createState() => _DentProfileScreenState();
}

class _DentProfileScreenState extends State<DentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Profile Page"),
      ),
    );
  }
}
