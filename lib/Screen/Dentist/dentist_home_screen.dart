import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DentHomeScreen extends StatefulWidget {
  final FirebaseUser user;
  DentHomeScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentHomeScreenState createState() => _DentHomeScreenState();
}

class _DentHomeScreenState extends State<DentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue[800],
          Colors.blue[400],
          Colors.blue[300]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome, ",
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.user.displayName,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
